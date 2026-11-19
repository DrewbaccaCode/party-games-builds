#!/bin/bash
# A match played by an exported copy of the game, the way friends' computers run it: one copy is the relay, three are
# bots that make a room, join it, vote, play TNT Run and come back to the lobby. The builds repository runs it on Windows,
# macOS and Linux against the very downloads it's about to publish. Run it with the game's executable:
#   bash tests/export_smoke.sh "build/linux/party_games.x86_64"
#   bash tests/export_smoke.sh "Party Games.app/Contents/MacOS/Party Games"
#   bash tests/export_smoke.sh "Party Games.exe"                    (in Git Bash)
# Everything is read from each bot's --log-file, since a Windows release build has no console to print to. (The relay's
# own log is lost when it's stopped, so the joins are what show it worked.)
GAME="$1"
[ -x "$GAME" ] || [ -f "$GAME" ] || { echo "No game at $GAME"; exit 1; }
export MSYS_NO_PATHCONV=1
OUT="$(mktemp -d)"
command -v cygpath > /dev/null && OUT="$(cygpath -m "$OUT")"   # (Windows: a path the game understands)
P=$((30000 + RANDOM % 20000))
FAIL=0
chk() { if eval "$2"; then echo "PASS $1"; else echo "FAIL $1"; FAIL=1; fi; }

# (the relay runs at 120 frames a second: 18000 frames is a 150-second backstop)
"$GAME" --headless --quit-after 18000 --log-file "$OUT/relay.txt" -- --relay --port=$P > /dev/null 2>&1 &
RELAY=$!
sleep 2
A="--bot --relay-addr=127.0.0.1 --relay-port=$P --want=3 --vote=0.5 --vote-mode=tntrun --tnt-fast --rounds=1 --quit-after=110"
# shellcheck disable=SC2086
"$GAME" --headless --log-file "$OUT/p0.txt" -- $A --profile=smoke0 --name=Host --code-out="$OUT/code" > /dev/null 2>&1 &
PIDS="$!"
sleep 1
for i in 1 2; do
	# shellcheck disable=SC2086
	"$GAME" --headless --log-file "$OUT/p$i.txt" -- $A --profile=smoke$i --name=Bot$i --code-in="$OUT/code" > /dev/null 2>&1 &
	PIDS="$PIDS $!"
done
# (a backstop in case a copy hangs)
( sleep 160; kill $PIDS $RELAY ) > /dev/null 2>&1 &
WATCH=$!
# shellcheck disable=SC2086
wait $PIDS
kill $RELAY $WATCH 2> /dev/null
wait $RELAY 2> /dev/null
sleep 1

chk "all three joined one room" "[ \$(grep -l 'join ok=true' '$OUT/p1.txt' '$OUT/p2.txt' | wc -l) -eq 2 ]"
chk "all three played it" "[ \$(grep -l 'phase=play' '$OUT'/p*.txt | wc -l) -eq 3 ]"
chk "everyone saw the same result" "[ \$(grep -h 'phase=results' '$OUT'/p*.txt | sed 's/.*places/places/; s/ id=.*//' | sort -u | wc -l) -eq 1 ]"
chk "and came back to the lobby" "[ \$(grep -l 'TEST done players=3' '$OUT'/p*.txt | wc -l) -eq 3 ]"
chk "no script errors" "! grep -l 'SCRIPT ERROR' '$OUT'/*.txt > /dev/null"
if [ $FAIL = 0 ]; then echo "EXPORT SMOKE PASSED"; else
	echo "EXPORT SMOKE FAILED"
	for f in "$OUT"/*.txt; do echo "== $f"; grep -v '^$' "$f" | tail -30; done
fi
rm -rf "$OUT"
exit $FAIL
