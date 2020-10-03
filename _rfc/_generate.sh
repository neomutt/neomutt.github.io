#!/bin/bash

TOP='<table class="quiet"><tr><td><pre class="line-numbers">'
MID='</pre></td><td><pre class="line-numbers">'
BOT='</pre></td></tr></table>'

FILE="$1"

[ -n "$FILE" ] || exit 1
[ -f "$FILE" ] || exit 1

echo "---"
echo "title: "
echo "description: "
echo "short: "
echo "---"

LINES=$(wc -l "$FILE")
LINES=${LINES%% *}

echo "$TOP"
for ((i = 1; i <= LINES; i++)); do
				printf "<a name=\"L%d\"></a><a href=\"#L%d\">%04d</a>\n" $i $i $i
done

echo "$MID"
cat "$FILE"
echo "$BOT"

