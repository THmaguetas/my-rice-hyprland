IGNORED_PLAYERS="whatsapp telegram discord firefox chrome"

player=$(playerctl --list-all)

for ignore in $IGNORED_PLAYERS; do
    player=$(echo "$player" | grep -v -i "$ignore")
done

player=$(echo "$player" | head -n 1)

if [ -n "$player" ]; then
    song=$(playerctl -p "$player" metadata --format "{{ artist }} - {{ title }}" 2>/dev/null)
fi

if [ -z "$song" ]; then
    echo " "
else
    short="${song:0:40}"

    if [ "${song}" -gt "40" ]; then
        short="${short}..."
    fi

    echo "$short"
fi
