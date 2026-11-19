# Party Games: downloads

Top-down party minigames for you and your friends: the TNT Games (TNT Run, Bow Spleef, TNT Tag, TNT Wizards), The
Quiver, Obstacles, Party Games and Zombies. Up to eight players, by room code.

**The download page: [drewbaccacode.github.io/party-games-builds](https://drewbaccacode.github.io/party-games-builds/)**

## The easy way: the launcher

Get **Party Games Launcher** from the [launcher release](https://github.com/DrewbaccaCode/party-games-builds/releases?q=launcher&expanded=true)
for your computer, extract it, and open it. It shows the newest version of the game: click **Install**, then **Play**.
Whenever there's a new version it appears in the launcher, so you're never left on an old one. Your settings stay put
between versions.

## Or download the game directly

- **[Windows](https://github.com/DrewbaccaCode/party-games-builds/releases/latest/download/PartyGames-Windows.zip)**:
  extract the ZIP and run `Party Games.exe`. If Windows says "Windows protected your PC", click **More info**, then
  **Run anyway**. (It isn't signed with a paid certificate; you only need to do this once.)
- **[macOS](https://github.com/DrewbaccaCode/party-games-builds/releases/latest/download/PartyGames-macOS.zip)**
  (Intel and Apple silicon): extract it and open `Party Games.app`. It's signed and notarized by Apple, so it opens
  like any app. (Older versions aren't: for those, try to open it once, then choose **Open Anyway** under System
  Settings > Privacy & Security.)
- **[Linux](https://github.com/DrewbaccaCode/party-games-builds/releases/latest/download/PartyGames-Linux.zip)**:
  extract it and run `party_games.x86_64`.

These links always point at the newest version.

## Playing together

Everyone needs the **same version**. The game shows a room code at the top of the screen: give it to your friends, and
they press **Join Game** and type it in. Then pull the lever by the wheel, or press **V** and vote.

| | Keyboard | Controller |
|---|---|---|
| Move | WASD / arrows | left stick |
| Jump | Space | A |
| Attack (hold to draw a bow) | Left click | Right trigger |
| Use | E | X |
| Vote | V | Y |
| Emote | T (hold) | LB (hold) |
| Menu and settings | Esc | Start |

Everything can be rebound in **Esc > Controls**. Press **C** in any game to look out of your own eyes.

## The games

**TNT Games:** four games back to back with one scoreboard (or pick one on the vote card).
- **TNT Run:** every tile you step on falls a moment later. Three floors; off the bottom you're out. Space twice to
  double jump (three a game).
- **Bow Spleef:** hold to draw, let go to shoot. Arrows burn out the floor where they land, so shoot it out from under
  people. Q arms a triple shot.
- **TNT Tag:** whoever holds the TNT has to hit someone else before the fuse runs out. Last one standing wins.
- **TNT Wizards:** two houses, three towers. Stand in a tower's circle to take it; first to 250 wins. Click casts a
  bolt, right-click your school's spell. While you're waiting to come back, 1 to 4 picks your school:

| | School | Bolt | Right-click |
|---|---|---|---|
| 1 | Fire | burns | Meteor: a slow, big blast where you aim |
| 2 | Ice | slows | Frost Nova: everyone near you slowed to a crawl |
| 3 | Kinetic | a huge push, little damage | Leap: up and away, shoving whoever you land by |
| 4 | Blood | heals you as it hits | Transfusion: heals you and your house nearby |

**The Quiver:** first person, one arrow a life, and it kills outright. Get it back by killing, or fetch it from where
it landed. Ten punches also kill. Most kills in 4 minutes wins.

**Obstacles:** a game show. Race the course; only the first few through each round go on, and the final decides the
winner. Shift dives, click grabs whoever's in front of you.

**Party Games:** five quick minigames from twelve, with the rules on a card before each one. Points for where you come.

**Zombies:** play together against waves of monsters. Spend gold on doors, weapons and upgrades. F drops a healing
circle. If you go down, a friend holds E on you to revive you.

## In the lobby

The mirror is the wardrobe (E). The cabinet on the wheel's stage holds a cup for every win this session. Kick the beach
ball about, ring the bell from the pink pad, or find someone for the seesaw. Hold T to emote.

## How these are made

Each new version of the game is built and checked automatically before it's published here: every script parses,
three bots play a match over a real relay, the Mac app is signed and notarized, and then the Windows, macOS and Linux
downloads themselves each play a match on their own system (`tests/export_smoke.sh`). This repository holds only the
build instructions, the download page (`docs/`) and the downloads.
