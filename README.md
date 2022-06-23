# Raven's AI Dome

Raven's AI Dome is a sandbox practice game mode for the Overwatch
Workshop.

## Summary

Up to six players are spread across the map "Workshop Expanse". Each player is
put in a bubble against an enemy dummy bot. The player kills the enemy bot and
progresses to the next hero in the list when the "Kill Goal" is met. The player
can select any hero they would like to practice on. The enemy spawn distances
and play area will automatically be adapted to the optimal sizes for the chosen
hero.

For more info, see:
[Raven's AI Dome](https://snowlune.github.io/RavensAIDome/)

## Files

`src/` contains all the text files of groups of rules that are compiled into the
mode file `ravensaidome.ow.txt` with Make.

## How to use

A premade release can be downloaded and imported into Overwatch right away.

-  Open `ravensaidome.ow.txt` in your favorite editor or notepad.
-  Select All (**ctrl-a**), then Copy (**ctrl-c**). The mode text file will now
   be in your clipboard.
-  Go to the Game Browser in _Overwatch_ >> Create >> Settings. There will be an
   orange button in the top right that will paste from your clipboard when you
   click it.

**You can also import the code **`BWGAP`** in Overwatch to get a recent build.
However, sometimes this isn't always up to date with the git version.**

### How to build

I build under WSL2 Ubuntu, but any kind of linux with GNU Make should work. From
the project root directory, run `make`. This creates `ravensaidome.ow.txt` which can be
imported as described above.

## Additional Information

The mode itself is over 12,000 lines of text and reaching even the new Overwatch
Workshop limit of 35,000 objects.

For this reason, it is \***\*NOT RECOMMENDED\*\*** to attempt to open it in the
Workshop Editor within Overwatch, as it will almost surely crash your game
client as it does mine. I use Visual Studio Code to edit and _highly_ recommend
it for anyone attempting to make a moderately large Overwatch Workshop mode. In
my experience, hand-coding Workshop modes furthers understanding of Workshop
actions and syntax. It also allows you to edit and think faster, ultimately
creating better code.

## Development History

I started this project in January 2020 as soon as the "Workshop Expanse" map was
released on the PTR. The idea came from my first practice mode on the Practice
Range that spawned random types of enemies and gave them _very_ rudimentary
movement. I knew I wanted something that would spawn enemies at random distances
from me and facing a random direction. Initially I only intended it to be a
small Widowmaker warm-up and flick practice mode. The current release is stable
and more or less functionally complete. More features and tweaks will happen as
I desire.

## Support Me

I've put more hours into this project than I have an any one job most likely.
It's been a passion project, but I have put my soul and _a lot_ of time into it.
Consider supporting me if you enjoy this project.

<pre><code>CashApp: $RavenQueenLuna
BTC: 3ApiPv3yjmZKo9T5SGSNTyNQVyPthobBEE
ETH: 0x3e1C67b95Db61f7F444bbDb74Dad8e2a689eA8a4
DOGE: DEAbvFjBbJb6yyABDjVrmJr8Z3Afi2qwSQ
Email snowluna@protonmail.com for different coin addresses not listed here</code></pre>
