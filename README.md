# Practice Field: Expanse
An Overwatch custom game workshop mode designed for warming up and practising against dummy bots.

### Summary 
This workshop mode puts up to six players spread across the "Workshop: Expanse" map, each confined to their own bubble and player zone.
A single enemy bot spawns for each player. Enemies spawn at a random position within a range based on the player's current hero, facing a random direction. The player kills their enemy a set number of times (defined by the global variable `globalKillQuota` or player variable `player_KillQuota`). The hero of the enemy increments when the kill quota is reached for each hero, iterating over the entire selected hero type array (`All Heroes` by default). 

There are three difficult settings: Easy, Medium, and Hard. 
For Easy-Hard, enemies don't move during the first half of kills of the kill quota.
#### Easy
The enemy only moves in a straight line with no strafing or jumping.
#### Medium
The enemy randomly strafes, crouches, and jumps while moving.
#### Hard
The enemy moves randomly and unpredictably the entire time.
#### AI Bronze - AI Grandmaster
The enemy moves randomly and attacks the player. Each hero uses their abilities against the player. The seven difficulties each affect the bots' aim, movement, and reaction time.
