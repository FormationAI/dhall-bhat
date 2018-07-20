
lint:
	find . -not -path '*/\.*' -type f -not -iname "*.md" -not -iname "*.sh" -not -iname "Makefile" -exec dhall lint --inplace {} \;

compile:
	./compile.sh
