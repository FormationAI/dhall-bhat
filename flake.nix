{
  description = "Tasty meal of Dhall";

  nixConfig = {
    ## https://github.com/NixOS/rfcs/blob/master/rfcs/0045-deprecate-url-syntax.md
    extra-experimental-features = ["no-url-literals"];
    extra-substituters = [
      "https://cache.dhall-lang.org"
      "https://cache.garnix.io"
      "https://dhall.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.dhall-lang.org:I9/H18WHd60olG5GsIjolp7CtepSgJmM2CsO813VTmM="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      "dhall.cachix.org-1:8laGciue2JBwD49ICFtg+cIF8ddDaW7OFBjDb/dHEAo="
    ];
    ## Isolate the build.
    registries = false;
    sandbox = true;
  };

  outputs = inputs: let
    pname = "dhall-bhat";
  in
    {
      overlays = {
        default = final: prev: {
          dhallPackages = prev.dhallPackages.override (old: {
            overrides =
              final.lib.composeExtensions
              (old.overrides or (_: _: {}))
              (inputs.self.overlays.dhall final prev);
          });
        };

        dhall = final: prev: dfinal: dprev: {
          ${pname} = inputs.self.packages.${final.system}.${pname};
        };
      };

      homeConfigurations =
        builtins.listToAttrs
        (builtins.map
          (inputs.flaky.lib.homeConfigurations.example
            pname
            inputs.self
            [
              ({pkgs, ...}: {
                ## TODO: Is there something more like `dhallWithPackages`?
                home.packages = [pkgs.dhallPackages.${pname}];
              })
            ])
          inputs.flake-utils.lib.defaultSystems);
    }
    // inputs.flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import inputs.nixpkgs {inherit system;};

      src = pkgs.lib.cleanSource ./.;

      format = inputs.flaky.lib.format pkgs {
        ## FIXME: All the non-dhall config here should be inherited from flaky.
        programs = {
          alejandra.enable = true;
          prettier.enable = true;
          shellcheck.enable = true;
          shfmt = {
            enable = true;
            indent_size = null;
          };
        };
        ## subsumes dhall (format)
        ## TODO: Add an option like `programs.dhall.lint = true;` to treefmt-nix
        settings.formatter.dhall-lint = {
          command = pkgs.dhall;
          excludes = [
            "**/.*"
            "*.json"
            "*.md"
            "*.yaml"
            "LICENSE"
            "Makefile"
            "docs/*"
            "flake.*"
            "scripts/*"
          ];
          includes = ["**/*"];
          options = ["lint"];
        };
      };
    in {
      packages = {
        default = inputs.self.packages.${system}.${pname};

        "${pname}" =
          inputs.bash-strict-mode.lib.checkedDrv pkgs
          (pkgs.dhallPackages.buildDhallDirectoryPackage {
            inherit src;
            name = pname;
            dependencies = [
              (pkgs.dhallPackages.buildDhallUrl {
                url = "https://prelude.dhall-lang.org/Optional/fold";
                hash = "sha256-xbnXL29ivaoOGWrBx0LMF1zWenF7iA+4rsEzOlpBMs8=";
                dhallHash = "sha256:c5b9d72f6f62bdaa0e196ac1c742cc175cd67a717b880fb8aec1333a5a4132cf";
              })
            ];
            source = true;
            document = true;
          });
      };

      devShells.default =
        inputs.flaky.lib.devShells.default pkgs inputs.self [] "";

      checks.format = format.check inputs.self;

      formatter = format.wrapper;
    });

  inputs = {
    bash-strict-mode = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:sellout/bash-strict-mode";
    };

    flake-utils.url = "github:numtide/flake-utils";

    flaky.url = "github:sellout/flaky";

    nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";
  };
}
