# Practice-Field-Expanse
An Overwatch custom game mode designed for thorough warming up and practicing.

### Summary 
This workshop mode puts up to six players spread across the Expanse map, each confined to their own bubble.
A single enemy bot spawns for each player. The player kills each enemy a set number of times (defined by the global variable `maxKills`). The hero of the enemy increments when `maxKills` is reached for each hero, iterating over the entire `All Heroes` array. 

For the first half of the kills, the enemy is stationary, spawning facing a random direction in a random position at a distance relating to the `currentKillNumber` and `maxKills`. In the second half the enemy spawns randomly as before, but is now moving in the direction they're facing.

There are three difficult settings: Easy, Medium, and Hard. 
#### Easy
The enemy only moves in a straight line with no strafing or jumping.
#### Medium
The enemy randomly strafes, crouches, and jumps while moving.
#### Hard
The enemy moves randomly and attacks the player.
Widowmaker is punished for missing shots, and if she doesn't not kill a target fast enough it will teleport.
