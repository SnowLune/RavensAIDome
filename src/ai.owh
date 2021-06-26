rule("aiSub_EnableAI")
{
	event
	{
		Subroutine;
		aiSub_EnableAI;
	}

	actions
	{
		Call Subroutine(allSub_WaitForFrame);
		Clear Status(Players In Slot(Slot Of(Event Player), Team 2), Unkillable);
		Players In Slot(Slot Of(Event Player), Team 2).bot_MoveWASDEnabled = True;
		Players In Slot(Slot Of(Event Player), Team 2).bot_MoveCrouchEnabled = True;
		Players In Slot(Slot Of(Event Player), Team 2).bot_MoveJumpEnabled = True;
		Players In Slot(Slot Of(Event Player), Team 2).ai_AIEnabled = True;
		Call Subroutine(aiSub_FacingReset);
	}
}

rule("aiSub_ReactionDelay")
{
	event
	{
		Subroutine;
		aiSub_ReactionDelay;
	}

	actions
	{
		Wait(Random Real(Players In Slot(Slot Of(Event Player), Team 2).ai_ReactionTime / 4, Players In Slot(Slot Of(Event Player), Team 2)
			.ai_ReactionTime), Ignore Condition);
	}
}

rule("aiSub_ButtonsReset")
{
	event
	{
		Subroutine;
		aiSub_ButtonsReset;
	}

	actions
	{
		Stop Holding Button(Players In Slot(Slot Of(Event Player), Team 2), Button(Primary Fire));
		Stop Holding Button(Players In Slot(Slot Of(Event Player), Team 2), Button(Secondary Fire));
		Stop Holding Button(Players In Slot(Slot Of(Event Player), Team 2), Button(Ability 1));
		Stop Holding Button(Players In Slot(Slot Of(Event Player), Team 2), Button(Ability 2));
		Stop Holding Button(Players In Slot(Slot Of(Event Player), Team 2), Button(Ultimate));
		Stop Holding Button(Players In Slot(Slot Of(Event Player), Team 2), Button(Jump));
		Stop Holding Button(Players In Slot(Slot Of(Event Player), Team 2), Button(Crouch));
		Stop Holding Button(Players In Slot(Slot Of(Event Player), Team 2), Button(Melee));
		Stop Holding Button(Players In Slot(Slot Of(Event Player), Team 2), Button(Reload));
		Wait(1 / 60, Ignore Condition);
	}
}

//
// Start AI bot aiming at player, inputs: ai_CnAim, ai_AimType, ai_AimBase
//
rule("aiSub_FacingStart")
{
	event
	{
		Subroutine;
		aiSub_FacingStart;
	}

	actions
	{
		Call Subroutine(allSub_WaitForFrame);
		Abort If(Players In Slot(Slot Of(Event Player), Team 2).ai_CnAim == False);
		Stop Facing(Players In Slot(Slot Of(Event Player), Team 2));

		"0 == hitscan/beam, 1 == projectile, 2 == arcing projectile"
		
		//
		// Hitscan
		//
		If(Players In Slot(Slot Of(Event Player), Team 2).ai_AimType == 0);
			
			// Body
			If(Players In Slot(Slot Of(Event Player), Team 2).ai_AimBase == 0);
				Start Facing(
					Players In Slot(Slot Of(Event Player), Team 2), 
					Direction From Angles(
						Horizontal Angle Towards(
							Players In Slot(Slot Of(Event Player), Team 2), 
							Eye Position(Players In Slot(Slot Of(Event Player), Team 1)) - Vector(0, 0.250, 0)
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModX,
						Vertical Angle From Direction(
							Direction Towards(
								Eye Position(Players In Slot(Slot Of(Event Player), Team 2)),
								Eye Position(Players In Slot(Slot Of(Event Player), Team 1)) - Vector(0, 0.250, 0)
							)
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModY
					),
					Players In Slot(Slot Of(Event Player), Team 2).ai_AimTurnRate,
					To Player,
					Direction and Turn Rate
				);

			// Head
			Else If(Players In Slot(Slot Of(Event Player), Team 2).ai_AimBase == 1);
				Start Facing(
					Players In Slot(Slot Of(Event Player), Team 2),
					Direction From Angles(
						Horizontal Angle Towards(
							Players In Slot(Slot Of(Event Player), Team 2),
							Eye Position(Players In Slot(Slot Of(Event Player), Team 1))
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModX,

						Vertical Angle From Direction(
							Direction Towards(
								Eye Position(Players In Slot(Slot Of(Event Player), Team 2)),
								Eye Position(Players In Slot(Slot Of(Event Player), Team 1))
							)
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModY
					),
					Players In Slot(Slot Of(Event Player), Team 2).ai_AimTurnRate,
					To Player,
					Direction and Turn Rate
				);

			// Position
			Else If(Players In Slot(Slot Of(Event Player), Team 2).ai_AimBase == 2);
				Start Facing(
					Players In Slot(Slot Of(Event Player), Team 2),
					Direction From Angles(
						Horizontal Angle Towards(
							Players In Slot(Slot Of(Event Player), Team 2),
							Position Of(Players In Slot(Slot Of(Event Player), Team 1))
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModX,
						
						Vertical Angle From Direction(
							Direction Towards(
								Eye Position(Players In Slot(Slot Of(Event Player), Team 2)),
								Position Of(Players In Slot(Slot Of(Event Player), Team 1))
							)
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModY
					),
					Players In Slot(Slot Of(Event Player), Team 2).ai_AimTurnRate,
					To Player,
					Direction and Turn Rate
				);
			
			// Relative
			Else If(Players In Slot(Slot Of(Event Player), Team 2).ai_AimBase == 3);
				Start Facing(
					Players In Slot(Slot Of(Event Player), Team 2),
					Direction From Angles(
						Horizontal Angle Towards(
							Players In Slot(Slot Of(Event Player), Team 2),
							Position Of(Players In Slot(Slot Of(Event Player), Team 1))
							+ Players In Slot(Slot Of(Event Player), Team 2).ai_FacingRelPosMod
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModX,

						Vertical Angle From Direction(
							Direction Towards(
								Eye Position(Players In Slot(Slot Of(Event Player), Team 2)),
								Position Of(Players In Slot(Slot Of(Event Player), Team 1))
								+ Players In Slot(Slot Of(Event Player), Team 2).ai_FacingRelPosMod
							)
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModY
					),
					Players In Slot(Slot Of(Event Player), Team 2).ai_AimTurnRate,
					To Player,
					Direction and Turn Rate
				);
			End;

		//
		// Projectile
		//
		// Uses the horizontal angle towards the vector resulting from: 
		// ((world vector of (speed * direction)) * (distance / projectile velocity)) + position of player
		// Basically taking the vector of "where the player will be in one second given current speed" and
		// scaling it based on distance from bot and projectile speed, 
		// then adding the position of the player to offset it from (0, 0, 0)
		//
		Else If(Players In Slot(Slot Of(Event Player), Team 2).ai_AimType == 1);

			// Body
			If(Players In Slot(Slot Of(Event Player), Team 2).ai_AimBase == 0);
				Start Facing(
					Players In Slot(Slot Of(Event Player), Team 2),
					Direction From Angles(
						Horizontal Angle Towards(
							Players In Slot(Slot Of(Event Player), Team 2),
							World Vector Of(
								Speed Of(Players In Slot(Slot Of(Event Player), Team 1))
								* Throttle Of(Players In Slot(Slot Of(Event Player), Team 1)),
								Players In Slot(Slot Of(Event Player), Team 1),
								Rotation
							)
							* (
								Distance Between(
									Position Of(Players In Slot(Slot Of(Event Player), Team 2)),
									Position Of(Players In Slot(Slot Of(Event Player), Team 1))
								)
								/ Players In Slot(Slot Of(Event Player), Team 2).ai_ProjectileSpeed
							)
							+ Position Of(Players In Slot(Slot Of(Event Player), Team 1))
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModX,
					
						Vertical Angle From Direction(
							Direction Towards(
								Eye Position(Players In Slot(Slot Of(Event Player), Team 2)),
								Eye Position(Players In Slot(Slot Of(Event Player), Team 1)) - Vector(0, 0.250, 0)
							)
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModY
					),
					Players In Slot(Slot Of(Event Player), Team 2).ai_AimTurnRate,
					To Player,
					Direction and Turn Rate
				);
			
			// Head
			Else If(Players In Slot(Slot Of(Event Player), Team 2).ai_AimBase == 1);
				Start Facing(
					Players In Slot(Slot Of(Event Player), Team 2),
					Direction From Angles(
						Horizontal Angle Towards(
							Players In Slot(Slot Of(Event Player), Team 2),
							World Vector Of(
								Speed Of(Players In Slot(Slot Of(Event Player), Team 1))
								* Throttle Of(Players In Slot(Slot Of(Event Player), Team 1)),
								Players In Slot(Slot Of(Event Player), Team 1),
								Rotation
							)
							* (
								Distance Between(
									Position Of(Players In Slot(Slot Of(Event Player), Team 2)),
									Position Of(Players In Slot(Slot Of(Event Player), Team 1))
								)
								/ Players In Slot(Slot Of(Event Player), Team 2).ai_ProjectileSpeed
							)
							+ Position Of(Players In Slot(Slot Of(Event Player), Team 1))
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModX,
					
						Vertical Angle From Direction(
							Direction Towards(
								Eye Position(Players In Slot(Slot Of(Event Player), Team 2)),
								Eye Position(Players In Slot(Slot Of(Event Player), Team 1))
							)
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModY
					),
					Players In Slot(Slot Of(Event Player), Team 2).ai_AimTurnRate,
					To Player,
					Direction and Turn Rate
				);
			
			// Position
			Else If(Players In Slot(Slot Of(Event Player), Team 2).ai_AimBase == 2);
				Start Facing(
					Players In Slot(Slot Of(Event Player), Team 2),
					Direction From Angles(
						Horizontal Angle Towards(
							Players In Slot(Slot Of(Event Player), Team 2),
							World Vector Of(
								Speed Of(Players In Slot(Slot Of(Event Player), Team 1))
								* Throttle Of(Players In Slot(Slot Of(Event Player), Team 1)),
								Players In Slot(Slot Of(Event Player), Team 1),
								Rotation
							)
							* (
								Distance Between(
									Position Of(Players In Slot(Slot Of(Event Player), Team 2)),
									Position Of(Players In Slot(Slot Of(Event Player), Team 1))
								)
								/ Players In Slot(Slot Of(Event Player), Team 2).ai_ProjectileSpeed
							)
							+ Position Of(Players In Slot(Slot Of(Event Player), Team 1))
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModX,
					
						Vertical Angle From Direction(
							Direction Towards(
								Eye Position(Players In Slot(Slot Of(Event Player), Team 2)),
								Position Of(Players In Slot(Slot Of(Event Player), Team 1))
							)
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModY
					),
					Players In Slot(Slot Of(Event Player), Team 2).ai_AimTurnRate,
					To Player,
					Direction and Turn Rate
				);

			// Relative
			Else If(Players In Slot(Slot Of(Event Player), Team 2).ai_AimBase == 3);
				Start Facing(
					Players In Slot(Slot Of(Event Player), Team 2),
					Direction From Angles(
						Horizontal Angle Towards(
							Players In Slot(Slot Of(Event Player), Team 2),
							World Vector Of(
								Speed Of(Players In Slot(Slot Of(Event Player), Team 1))
								* Throttle Of(Players In Slot(Slot Of(Event Player), Team 1)),
								Players In Slot(Slot Of(Event Player), Team 1),
								Rotation
							)
							* (
								Distance Between(
									Position Of(Players In Slot(Slot Of(Event Player), Team 2)),
									Position Of(Players In Slot(Slot Of(Event Player), Team 1))
								)
								/ Players In Slot(Slot Of(Event Player), Team 2).ai_ProjectileSpeed
							)
							+ Position Of(Players In Slot(Slot Of(Event Player), Team 1))
							+ Players In Slot(Slot Of(Event Player), Team 2).ai_FacingRelPosMod
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModX,
					
						Vertical Angle From Direction(
							Direction Towards(
								Eye Position(Players In Slot(Slot Of(Event Player), Team 2)),
								Position Of(Players In Slot(Slot Of(Event Player), Team 1))
								+ Players In Slot(Slot Of(Event Player), Team 2).ai_FacingRelPosMod
							)
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModY
					),
					Players In Slot(Slot Of(Event Player), Team 2).ai_AimTurnRate,
					To Player,
					Direction and Turn Rate
				);
			End;

		//
		// Arcing Projectile
		//
		Else If(Players In Slot(Slot Of(Event Player), Team 2).ai_AimType == 2);

			// Body
			If(Players In Slot(Slot Of(Event Player), Team 2).ai_AimBase == 0);
				Start Facing(
					Players In Slot(Slot Of(Event Player), Team 2),
					Direction From Angles(
						Horizontal Angle Towards(
							Players In Slot(Slot Of(Event Player), Team 2),
							World Vector Of(
								Speed Of(Players In Slot(Slot Of(Event Player), Team 1))
								* Throttle Of(Players In Slot(Slot Of(Event Player), Team 1)),
								Players In Slot(Slot Of(Event Player), Team 1),
								Rotation
							)
							* (
								Distance Between(
									Position Of(Players In Slot(Slot Of(Event Player), Team 2)),
									Position Of(Players In Slot(Slot Of(Event Player), Team 1))
								)
								/ Players In Slot(Slot Of(Event Player), Team 2).ai_ProjectileSpeed
							)
							+ Position Of(Players In Slot(Slot Of(Event Player), Team 1))
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModX,
					
						Vertical Angle From Direction(
							Direction Towards(
								Eye Position(Players In Slot(Slot Of(Event Player), Team 2)),
								Eye Position(Players In Slot(Slot Of(Event Player), Team 1)) - Vector(0, 0.250, 0)
							)
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModY
						+ Arcsine In Degrees(
							-15.800 * (
								Distance Between(
									Eye Position(Players In Slot(Slot Of(Event Player), Team 2)),
									Eye Position(Players In Slot(Slot Of(Event Player), Team 1)) - Vector(0, 0.250, 0)
								)
							)
							/ Players In Slot(Slot Of(Event Player), Team 2).ai_ProjectileSpeed ^ 2
						) / 2
					),
					Players In Slot(Slot Of(Event Player), Team 2).ai_AimTurnRate,
					To Player,
					Direction and Turn Rate
				);
			
			// Head
			Else If(Players In Slot(Slot Of(Event Player), Team 2).ai_AimBase == 1);
				Start Facing(
					Players In Slot(Slot Of(Event Player), Team 2),
					Direction From Angles(
						Horizontal Angle Towards(
							Players In Slot(Slot Of(Event Player), Team 2),
							World Vector Of(
								Speed Of(Players In Slot(Slot Of(Event Player), Team 1))
								* Throttle Of(Players In Slot(Slot Of(Event Player), Team 1)),
								Players In Slot(Slot Of(Event Player), Team 1),
								Rotation
							)
							* (
								Distance Between(
									Position Of(Players In Slot(Slot Of(Event Player), Team 2)),
									Position Of(Players In Slot(Slot Of(Event Player), Team 1))
								)
								/ Players In Slot(Slot Of(Event Player), Team 2).ai_ProjectileSpeed
							)
							+ Position Of(Players In Slot(Slot Of(Event Player), Team 1))
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModX,
					
						Vertical Angle From Direction(
							Direction Towards(
								Eye Position(Players In Slot(Slot Of(Event Player), Team 2)),
								Eye Position(Players In Slot(Slot Of(Event Player), Team 1))
							)
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModY
						+ Arcsine In Degrees(
							-15.800 * (
								Distance Between(
									Eye Position(Players In Slot(Slot Of(Event Player), Team 2)),
									Eye Position(Players In Slot(Slot Of(Event Player), Team 1))
								)
							)
							/ Players In Slot(Slot Of(Event Player), Team 2).ai_ProjectileSpeed ^ 2
						) / 2
					),
					Players In Slot(Slot Of(Event Player), Team 2).ai_AimTurnRate,
					To Player,
					Direction and Turn Rate
				);
			
			// Position
			Else If(Players In Slot(Slot Of(Event Player), Team 2).ai_AimBase == 2);
				Start Facing(
					Players In Slot(Slot Of(Event Player), Team 2),
					Direction From Angles(
						Horizontal Angle Towards(
							Players In Slot(Slot Of(Event Player), Team 2),
							World Vector Of(
								Speed Of(Players In Slot(Slot Of(Event Player), Team 1))
								* Throttle Of(Players In Slot(Slot Of(Event Player), Team 1)),
								Players In Slot(Slot Of(Event Player), Team 1),
								Rotation
							)
							* (
								Distance Between(
									Position Of(Players In Slot(Slot Of(Event Player), Team 2)),
									Position Of(Players In Slot(Slot Of(Event Player), Team 1))
								)
								/ Players In Slot(Slot Of(Event Player), Team 2).ai_ProjectileSpeed
							)
							+ Position Of(Players In Slot(Slot Of(Event Player), Team 1))
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModX,
					
						Vertical Angle From Direction(
							Direction Towards(
								Eye Position(Players In Slot(Slot Of(Event Player), Team 2)),
								Position Of(Players In Slot(Slot Of(Event Player), Team 1))
							)
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModY
						+ Arcsine In Degrees(
							-15.800 * (
								Distance Between(
									Eye Position(Players In Slot(Slot Of(Event Player), Team 2)),
									Position Of(Players In Slot(Slot Of(Event Player), Team 1))
								) 
							)
							/ Players In Slot(Slot Of(Event Player), Team 2).ai_ProjectileSpeed ^ 2
						) / 2
					),
					Players In Slot(Slot Of(Event Player), Team 2).ai_AimTurnRate,
					To Player,
					Direction and Turn Rate
				);

			// Relative
			Else If(Players In Slot(Slot Of(Event Player), Team 2).ai_AimBase == 3);
				Start Facing(
					Players In Slot(Slot Of(Event Player), Team 2),
					Direction From Angles(
						Horizontal Angle Towards(
							Players In Slot(Slot Of(Event Player), Team 2),
							World Vector Of(
								Speed Of(Players In Slot(Slot Of(Event Player), Team 1))
								* Throttle Of(Players In Slot(Slot Of(Event Player), Team 1)),
								Players In Slot(Slot Of(Event Player), Team 1),
								Rotation
							)
							* (
								Distance Between(
									Position Of(Players In Slot(Slot Of(Event Player), Team 2)),
									Position Of(Players In Slot(Slot Of(Event Player), Team 1))
								)
								/ Players In Slot(Slot Of(Event Player), Team 2).ai_ProjectileSpeed
							)
							+ Position Of(Players In Slot(Slot Of(Event Player), Team 1))
							+ Players In Slot(Slot Of(Event Player), Team 2).ai_FacingRelPosMod
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModX,
					
						Vertical Angle From Direction(
							Direction Towards(
								Eye Position(Players In Slot(Slot Of(Event Player), Team 2)),
								Position Of(Players In Slot(Slot Of(Event Player), Team 1))
								+ Players In Slot(Slot Of(Event Player), Team 2).ai_FacingRelPosMod
							)
						)
						+ Players In Slot(Slot Of(Event Player), Team 2).ai_AimModY
						+ Arcsine In Degrees(
							-15.800 * (
								Distance Between(
									Eye Position(Players In Slot(Slot Of(Event Player), Team 2)),
									Position Of(Players In Slot(Slot Of(Event Player), Team 1))
									+ Players In Slot(Slot Of(Event Player), Team 2).ai_FacingRelPosMod
								)
							)
							/ Players In Slot(Slot Of(Event Player), Team 2).ai_ProjectileSpeed ^ 2
						) / 2
					),
					Players In Slot(Slot Of(Event Player), Team 2).ai_AimTurnRate,
					To Player,
					Direction and Turn Rate
				);
			End;
		End;
	}
}

rule("aiSub_FacingLookAt")
{
	event
	{
		Subroutine;
		aiSub_FacingLookAt;
	}

	actions
	{
		Players In Slot(Slot Of(Event Player), Team 2).ai_CnAim = False;
		Wait(2 / 60, Ignore Condition);
		Players In Slot(Slot Of(Event Player), Team 2).ai_AimTurnRate = Random Real(Players In Slot(Slot Of(Event Player), Team 2)
			.ai_FacingCapMin, Players In Slot(Slot Of(Event Player), Team 2).ai_FacingCapMin * 1.500);
		Stop Facing(Players In Slot(Slot Of(Event Player), Team 2));
		Start Facing(Players In Slot(Slot Of(Event Player), Team 2), Direction Towards(Eye Position(Players In Slot(Slot Of(Event Player),
			Team 2)), Players In Slot(Slot Of(Event Player), Team 2).ai_LookAtVector), Evaluate Once(Random Real(Players In Slot(Slot Of(
			Event Player), Team 2).ai_FacingCapMin, Players In Slot(Slot Of(Event Player), Team 2).ai_FacingCapMax)), To World,
			Direction and Turn Rate);
		Wait Until(Is In View Angle(Players In Slot(Slot Of(Event Player), Team 2), Players In Slot(Slot Of(Event Player), Team 2)
			.ai_LookAtVector - Vector(0, Y Component Of(Eye Position(Players In Slot(Slot Of(Event Player), Team 2))), 0), 12.500), 2);
		Stop Facing(Players In Slot(Slot Of(Event Player), Team 2));
	}
}

rule("aiSub_FacingReset")
{
	event
	{
		Subroutine;
		aiSub_FacingReset;
	}

	actions
	{
		Players In Slot(Slot Of(Event Player), Team 2).ai_AimType = Players In Slot(Slot Of(Event Player), Team 2).ai_AimTypeDefault;
		Players In Slot(Slot Of(Event Player), Team 2).ai_AimBase = Players In Slot(Slot Of(Event Player), Team 2).ai_AimBaseDefault;
		Call Subroutine(aiSub_FacingStart);
	}
}

rule("AI Aim Mod Calculation")
{
	event
	{
		Subroutine;
		aiSub_AimModSet;
	}

	actions
	{
		Stop Chasing Player Variable(Event Player, ai_AimModX);
		Stop Chasing Player Variable(Event Player, ai_AimModY);
		If(Array Contains(Global.c_ScopeHeroes, Hero Of(Event Player)) && Is Firing Secondary(Event Player));
			If(Horizontal Angle Towards(Event Player, Players In Slot(Slot Of(Event Player), Team 1)) > 0);
				Chase Player Variable Over Time(
					Event Player,
					ai_AimModX,
					Random Real(0, 
						(Global.c_MaxDifficulty - Players In Slot(Slot Of(Event Player), Team 1).p_Difficulty) * 0.250 + 0.250
					),
					Random Real(0.100, 0.250),
					None
				);
			Else;
				Chase Player Variable Over Time(
					Event Player,
					ai_AimModX,
					Random Real(
						(Global.c_MaxDifficulty - Players In Slot(Slot Of(Event Player), Team 1).p_Difficulty) * -0.250 - 0.250, 
						0
					),
					Random Real(0.100, 0.250),
					None
				);
			End;

			Event Player.ai_AimModY = Random Real(
				(Global.c_MaxDifficulty - Players In Slot(Slot Of(Event Player), Team 1).p_Difficulty) * -0.250 - 0.250,
				(Global.c_MaxDifficulty - Players In Slot(Slot Of(Event Player), Team 1).p_Difficulty) * 0.250 + 0.250
			);

		Else;
			If(Horizontal Angle Towards(Event Player, Players In Slot(Slot Of(Event Player), Team 1)) > 0);
				Chase Player Variable Over Time(
					Event Player,
					ai_AimModX,
					Random Real(0, 
						(Global.c_MaxDifficulty - Players In Slot(Slot Of(Event Player), Team 1).p_Difficulty) * 0.500 + 0.500
					),
					Random Real(0.100, 0.250),
					None
				);
			Else;
				Chase Player Variable Over Time(
					Event Player,
					ai_AimModX,
					Random Real(
						(Global.c_MaxDifficulty - Players In Slot(Slot Of(Event Player), Team 1).p_Difficulty) * -0.500 - 0.500,
						0
					),
					Random Real(0.100, 0.250),
					None
				);
			End;

			Event Player.ai_AimModY = Random Real(
				(Global.c_MaxDifficulty - Players In Slot(Slot Of(Event Player), Team 1).p_Difficulty) * -0.350 - 0.350,
				(Global.c_MaxDifficulty - Players In Slot(Slot Of(Event Player), Team 1).p_Difficulty) * 0.350 + 0.350
			);
		End;
	}
}

rule("AI Aim Calculation")
{
	event
	{
		Subroutine;
		aiSub_AimCalculation;
	}

	actions
	{
		Call Subroutine(allSub_WaitForFrame);

		If(Event Player.ai_AimTurnRate == 0);
			Chase Player Variable Over Time(Event Player, ai_AimTurnRate, Random Real(Event Player.ai_FacingPadMin / 2,
				Event Player.ai_FacingPadMax / 2), Random Real(0.050, 0.100), None);
			Wait(0.150, Ignore Condition);
			Stop Chasing Player Variable(Event Player, ai_AimTurnRate);

		Else If(Random Real(0, 1) < 0.850 - Event Player.ai_ChanceMod);
			Event Player.ai_AimStopTime = Total Time Elapsed + Random Real(0.650, 0.750) - Event Player.ai_ChanceMod;
			Chase Player Variable At Rate(Event Player, ai_AimTurnRate, 0, Random Integer(250, 500), Destination and Rate);
			Wait Until(Event Player.ai_AimTurnRate == 0, Random Real(0.650, 0.750) - Event Player.ai_ChanceMod);
			Stop Chasing Player Variable(Event Player, ai_AimTurnRate);
			Chase Player Variable Over Time(Event Player, ai_AimTurnRate, 0, Random Real(0.650, 0.750) - Event Player.ai_ChanceMod, None);
			Call Subroutine(aiSub_AimModSet);

		Else;
			Event Player.ai_AimTurnRate = (Event Player.ai_FacingAngleMod * Angle Between Vectors(Facing Direction Of(Event Player),
				Direction Towards(Eye Position(Event Player), Eye Position(Players In Slot(Slot Of(Event Player), Team 1)) - Vector(0, 0.300,
				0)))) ^ Event Player.ai_FacingAnglePow + Random Real(Event Player.ai_FacingPadMin, Event Player.ai_FacingPadMax);
		End;

		If(Array Contains(Global.c_ScopeHeroes, Hero Of(Event Player)) && Is Firing Secondary(Event Player));
			Event Player.ai_AimTurnRate = Event Player.ai_AimTurnRate / 1.500;
		End;
	}
}

rule("aiSub_FlickIn")
{
	event
	{
		Subroutine;
		aiSub_FlickIn;
	}

	actions
	{
		Stop Facing(Players In Slot(Slot Of(Event Player), Team 2));
		If(Players In Slot(Slot Of(Event Player), Team 2).ai_AimBase == 0);
			Start Facing(Players In Slot(Slot Of(Event Player), Team 2), Direction Towards(Eye Position(Event Player), Eye Position(
				Players In Slot(Slot Of(Event Player), Team 1)) - Vector(0, 0.250, 0)), Evaluate Once(Random Integer(Players In Slot(Slot Of(
				Event Player), Team 2).ai_FacingCapMax - 180, Players In Slot(Slot Of(Event Player), Team 2).ai_FacingCapMax)), To World,
				Direction and Turn Rate);
			Wait Until(Is In View Angle(Players In Slot(Slot Of(Event Player), Team 2), Vector(X Component Of(Eye Position(Players In Slot(
				Slot Of(Event Player), Team 1)) - Vector(0, 0.250, 0)), Y Component Of(Eye Position(Players In Slot(Slot Of(Event Player),
				Team 1)) - Vector(0, 0.250, 0)) - Y Component Of(Eye Position(Players In Slot(Slot Of(Event Player), Team 2)) - Vector(0,
				0.250, 0)), Z Component Of(Eye Position(Players In Slot(Slot Of(Event Player), Team 1)))), 0.500), 1);
		Else If(Players In Slot(Slot Of(Event Player), Team 2).ai_AimBase == 1);
			Start Facing(Players In Slot(Slot Of(Event Player), Team 2), Direction Towards(Eye Position(Event Player), Eye Position(
				Players In Slot(Slot Of(Event Player), Team 1))), Evaluate Once(Random Integer(Players In Slot(Slot Of(Event Player), Team 2)
				.ai_FacingCapMax - 180, Players In Slot(Slot Of(Event Player), Team 2).ai_FacingCapMax)), To World, Direction and Turn Rate);
			Wait Until(Is In View Angle(Players In Slot(Slot Of(Event Player), Team 2), Vector(X Component Of(Eye Position(Players In Slot(
				Slot Of(Event Player), Team 1))), Y Component Of(Eye Position(Players In Slot(Slot Of(Event Player), Team 1)))
				- Y Component Of(Eye Position(Players In Slot(Slot Of(Event Player), Team 2))), Z Component Of(Eye Position(Players In Slot(
				Slot Of(Event Player), Team 1)))), 0.500), 1);
		End;
	}
}

rule("aiSub_FlickOut")
{
	event
	{
		Subroutine;
		aiSub_FlickOut;
	}

	actions
	{
		Stop Facing(Players In Slot(Slot Of(Event Player), Team 2));
		Start Facing(Players In Slot(Slot Of(Event Player), Team 2), Direction From Angles(Horizontal Facing Angle Of(Players In Slot(
			Slot Of(Event Player), Team 2)) - Random Real(0.600, 1), Vertical Facing Angle Of(Players In Slot(Slot Of(Event Player),
			Team 2)) - Random Real(0.300, 0.700)), Evaluate Once(Random Integer(Players In Slot(Slot Of(Event Player), Team 2)
			.ai_FacingCapMax - 180, Players In Slot(Slot Of(Event Player), Team 2).ai_FacingCapMax)), To World, None);
		Wait(Random Real(0.100, 0.200), Ignore Condition);
		Call Subroutine(aiSub_FacingReset);
	}
}

