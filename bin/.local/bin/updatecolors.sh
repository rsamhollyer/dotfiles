#!/bin/env bash


WAL_JSON_PATH=~/.cache/wal/colors.json
WAL_COLOR=$(jq .colors.color4 $WAL_JSON_PATH)
WAL_COLOR=$(sed -e 's/^"//' -e 's/"$//' <<<"$WAL_COLOR")

WAL_COLOR2=$(jq .colors.color5 $WAL_JSON_PATH)
WAL_COLOR2=$(sed -e 's/^"//' -e 's/"$//' <<<"$WAL_COLOR2")
VSCODE_SETS=~/.config/Code\ -\ Insiders/User/settings.json
tmpfile=$(mktemp)

jq --arg newval "$WAL_COLOR" '."editor.tokenColorCustomizations".textMateRules[2].settings.foreground |= $newval' "$VSCODE_SETS" > "$tmpfile" && mv "$tmpfile" "$VSCODE_SETS"

tmpfile2=$(mktemp)

jq --arg newval2 "$WAL_COLOR2" '."editor.tokenColorCustomizations".textMateRules[1].settings.foreground |= $newval2' "$VSCODE_SETS" > "$tmpfile2" && mv "$tmpfile2" "$VSCODE_SETS"

exit 0