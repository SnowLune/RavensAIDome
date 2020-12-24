# Practice Field: Expanse
Practice Field: Expanse is a sandbox practice game mode for the Overwatch Workshop.

## Summary
Up to six players are spread across the map "Workshop Expanse". Each player is put in a bubble against an enemy dummy bot. The player kills the enemy bot and progresses to the next hero in the list when the "Kill Goal" is met. The player can select any hero they would like to practice on. The enemy spawn distances and play area will automatically be adapted to the optimal sizes for the chosen hero.

For more info, see: [Practice Field: Expanse](https://snowroberge.github.io/PracticeFieldExpanse/)
## Files
The main file containing the mode [`PracticeFieldExpanse.txt`](https://github.com/SnowRoberge/PracticeFieldExpanse/blob/master/PracticeFieldExpanse.txt) is a simple text file.
## Additional Information
The mode itself is over 12,000 lines of text and reaching even the new Overwatch Workshop limit of 35,000 objects.

For this reason, it is __**NOT RECOMMENDED**__ to attempt to open it in the Workshop Editor within Overwatch, as it will almost surely crash your game client as it does mine. I use Visual Studio Code to edit and *highly* recommend it for anyone attempting to make a moderately large Overwatch Workshop mode. In my experience, hand-coding Workshop modes furthers understanding of Workshop actions and syntax. It also allows you to edit and think faster, ultimately creating better code.

After a version is ready for release, I import it into a custom game, then recopy it and save *that* as the mode file. This formats the text and eliminates any parenthetical discrepancies, making math bugs easier to identify.
## Development History
I started this project in January 2020 as soon as the "Workshop Expanse" map was released on the PTR. The idea came from my first practice mode on the Practice Range that spawned random types of enemies and gave them *very* rudimentary movement. I knew I wanted something that would spawn enemies at random distances from me and facing a random direction. Initially I only intended it to be a small Widowmaker warm-up and flick practice mode. It is currently in the pre-release stage with changes happening rapidly. **I anticipate to release version 1.0.0 by January 1, 2020.**
