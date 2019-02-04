#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

DHALL=dhall
project=$(basename -- $(realpath "./"))
kind_pattern='Kind$'
type_pattern='Type$'

echo '<html>'
echo '<head>'
echo '<title>'$project'</title>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'
echo '</head>'
echo '<body>'
echo '<h1>'$project'</h1>'

for f in $(./scripts/find-dhall-files.sh | sort)
do
    if [ -d "$f" ]; then
        level=$(awk -F"/" '{print NF}' <<< $f)
        echo "<h$level style=\"background-color: #bbb; width: 100%\">$f</h$level>"
    else
        comment=$(cat $f | grep -Pzo '(?s){-(.*)-}' || true)
        type=$($DHALL resolve <<< $f | $DHALL type)
        if [[ $type =~ $kind_pattern ]] ; then
            echo "<h4>"$(basename -- "$f")" (kind)</h4>";
            echo "<p>$comment</p>"
            echo '<dl>'
            echo '<dt>sort</dt><dd><pre>'
            echo "$type"
            echo '</pre></dd>'
            echo '<dt>kind</dt><dd><pre>'
            $DHALL <<< $f
            echo '</pre></dd>'
            echo '</dl>'
        else
            if [[ $type =~ $type_pattern ]] ; then
                echo "<h4>"$(basename -- "$f")" (type)</h4>";
                echo "<p>$comment</p>"
                echo '<dl>'
                echo '<dt>kind</dt><dd><pre>'
                echo "$type"
                echo '</pre></dd>'
                echo '<dt>type</dt><dd><pre>'
                $DHALL <<< $f
                echo '</pre></dd>'
                echo '</dl>'
            else
                echo "<h4>"$(basename -- "$f")" (term)</h4>";
                echo "<p>$comment</p>"
                echo '<dl>'
                echo '<dt>type</dt><dd><pre>'
                echo "$type"
                echo '</pre></dd>'
                echo '</dl>'
            fi
        fi
    fi
done

echo '</body></html>'
