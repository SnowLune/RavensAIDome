rule("botSub_ResetBot")
{
	event
	{
		Subroutine;
		botSub_ResetBot;
	}

	actions
	{
		Players In Slot(Slot Of(Event Player), Team 2).bot_BotResetComplete = False;

		"Disable AI Mode"
		If(Players In Slot(Slot Of(Event Player), Team 2).ai_AIEnabled == True && Global.g_DebugMode == False);
			Players In Slot(Slot Of(Event Player), Team 2).ai_AIEnabled = False;
			Players In Slot(Slot Of(Event Player), Team 2).bot_MoveWASDEnabled = False;
			Players In Slot(Slot Of(Event Player), Team 2).bot_MoveCrouchEnabled = False;
			Players In Slot(Slot Of(Event Player), Team 2).bot_MoveJumpEnabled = False;
			Players In Slot(Slot Of(Event Player), Team 2).ai_IsInAbilitySub = False;
			Players In Slot(Slot Of(Event Player), Team 2).ai_HeroInitialized = False;
			Players In Slot(Slot Of(Event Player), Team 2).ai_StrafeDistanceMod = 5;
		End;

		"Cancel Current Abilities and Disable Buttons"
		Cancel Primary Action(Players In Slot(Slot Of(Event Player), Team 2));
		Call Subroutine(aiSub_ButtonsReset);

		"Stop facing and throttle"
		Call Subroutine(botSub_ThrottleStop);
		Stop Facing(Players In Slot(Slot Of(Event Player), Team 2));

		"Force to be current hero or create dummy bot"
		Call Subroutine(allSub_WaitForFrame);
		If(
			Hero Of(Players In Slot(Slot Of(Event Player), Team 2))
			!= Players In Slot(Slot Of(Event Player), Team 1).p_HeroList
				[Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumber]
		);
			If(Entity Exists(Players In Slot(Slot Of(Event Player), Team 2)));
				Call Subroutine(allSub_WaitForFrame);
				Destroy Dummy Bot(Team 2, Slot Of(Event Player));
				Wait Until(Entity Exists(Players In Slot(Slot Of(Event Player), Team 2)) == False, 5);
			End;
			Call Subroutine(allSub_WaitForFrame);
			Create Dummy Bot(
				Players In Slot(Slot Of(Event Player), Team 1).p_HeroList
					[Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumber],
				Team 2,
				Slot Of(Event Player),
				Vector(0, 0, 0),
				Vector(0, 0, 0)
			);
			Wait Until(Entity Exists(Players In Slot(Slot Of(Event Player), Team 2)), 5);

			"If Mirror Mode is on use the Player's name"
			If(Players In Slot(Slot Of(Event Player), Team 1).p_MirrorModeEnabled == True);
				Start Forcing Dummy Bot Name(
					Players In Slot(Slot Of(Event Player), Team 2),
					Custom String("{0}", Players In Slot(Slot Of(Event Player), Team 1))
				);

			"Give the bot a silly name. For Fun."
			Else If(Global.g_UseBotNames == True);
				If(
					Count Of(Global.g_BotNames)
					- Count Of(Mapped Array(All Players(Team 1), Custom String("{0}", Current Array Element))) <= 0
				);
					Global.g_BotNames = Append To Array(Global.c_BotNamesConst, Global.g_PlayerNames);
				End;

				Players In Slot(Slot Of(Event Player), Team 2).bot_Name = Random Value In Array(
					Remove From Array(
						Global.g_BotNames,
						Mapped Array(All Players(Team 1), Custom String("{0}", Current Array Element))
					)
				);

				Modify Global Variable(
					g_BotNames,
					Remove From Array By Value,
					Players In Slot(Slot Of(Event Player), Team 2).bot_Name
				);

				Stop Forcing Dummy Bot Name(Players In Slot(Slot Of(Event Player), Team 2));
				Start Forcing Dummy Bot Name(
					Players In Slot(Slot Of(Event Player), Team 2),
					Players In Slot(Slot Of(Event Player), Team 2).bot_Name
				);
			End;

			Call Subroutine(pSub_SetDifficulty);
			Disable Built-In Game Mode Respawning(Players In Slot(Slot Of(Event Player), Team 2));
			Call Subroutine(allSub_WaitForFrame);
			Set Invisible(Players In Slot(Slot Of(Event Player), Team 2), All);
			
			"Wait a frame after changing hero or creating bot"
			Call Subroutine(allSub_WaitForFrame);
			Small Message(
				Players In Slot(Slot Of(Event Player), Team 1),
				Custom String(
					"{0}  {1}!",
					Hero Icon String(
						Hero Of(Players In Slot(Slot Of(Event Player), Team 2))
					),
					Hero Of(Players In Slot(Slot Of(Event Player), Team 2))
				)
			);
		End;

		"Set Unkillable"
		Call Subroutine(allSub_WaitForFrame);
		If(
			Players In Slot(Slot Of(Event Player), Team 1).p_Difficulty >= 3
			&& 
			(Global.g_DebugHero[0] == False && Global.g_DebugMode == False)
			== True
		);
			Set Status(Players In Slot(Slot Of(Event Player), Team 2), Null, Unkillable, 9999);
		End;

		If(Players In Slot(Slot Of(Event Player), Team 1).p_Difficulty >= 3);
			Players In Slot(Slot Of(Event Player), Team 2).ai_StrafeDistanceMod = 5;
			If(Global.g_DebugHero[0] == True || Global.g_DebugMode == True);
				Call Subroutine(aiSub_EnableAI);
			End;
		End;

		"Disable Ultimate if player has that option set"
		If(Players In Slot(Slot Of(Event Player), Team 1).p_BotUltimateDisabled == True);
			Set Ultimate Ability Enabled(Players In Slot(Slot Of(Event Player), Team 2), False);
		End;

		Players In Slot(Slot Of(Event Player), Team 2).bot_BotResetComplete = True;
	}
}

rule("botSub_SetHero")
{
	event
	{
		Subroutine;
		botSub_SetHero;
	}

	actions
	{
		If(
			Health(Players In Slot(Slot Of(Event Player), Team 1))
			!=
			Max Health(Players In Slot(Slot Of(Event Player), Team 1))
		);
			Heal(
				Players In Slot(Slot Of(Event Player), Team 1),
				Null,
				Max Health(Players In Slot(Slot Of(Event Player), Team 1))
			);
		End;

		Players In Slot(Slot Of(Event Player), Team 1).all_Kills = 0;
		Players In Slot(Slot Of(Event Player), Team 2).all_Kills = 0;

		// Next hero in list
		If(Players In Slot(Slot Of(Event Player), Team 1).p_HeroNumberMod == 1);
			If(Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumber == Count Of(Event Player.p_HeroList) - 1);
				Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumber = 0;
			Else;
				Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumber =
					Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumberNext;
			End;

		// Previous hero in list
		Else If(Players In Slot(Slot Of(Event Player), Team 1).p_HeroNumberMod == -1);
			If(Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumber == 0);
				Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumber = 
					Count Of(Players In Slot(Slot Of(Event Player), Team 1).p_HeroList) - 1;
			Else;
				Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumber -= 1;
			End;
		End;

		// Set next hero number
		If(
			Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumber
			==
			Count Of(Players In Slot(Slot Of(Event Player), Team 1).p_HeroList) - 1
		);
			Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumberNext = 0;

		Else;
			Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumberNext =
				Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumber + 1;
		End;
		
		Players In Slot(Slot Of(Event Player), Team 1).p_HeroNumberMod = 0;
		Call Subroutine(botSub_ResetBot);
		Call Subroutine(botSub_TeleportBot);
	}
}

rule("botSub_TeleportBot")
{
	event
	{
		Subroutine;
		botSub_TeleportBot;
	}

	actions
	{
		Stop Forcing Player Position(Players In Slot(Slot Of(Event Player), Team 2));
		Call Subroutine(allSub_WaitForFrame);

		Set Invisible(Players In Slot(Slot Of(Event Player), Team 2), All);
		Call Subroutine(allSub_WaitForFrame);

		Set Facing(
			Players In Slot(Slot Of(Event Player), Team 2),
			Vector(
				Random Real(-1, 1),
				Random Real(-0.500, 0.500),
				Random Real(-1,	1)
			),
			To Player
		);
		Call Subroutine(allSub_WaitForFrame);

		Players In Slot(Slot Of(Event Player), Team 1).p_EnemyDistanceMod = 
			Players In Slot(Slot Of(Event Player), Team 1).p_EnemyDistanceMax
			/ Players In Slot(Slot Of(Event Player), Team 1).p_KillGoal * 2;
		Call Subroutine(allSub_WaitForFrame);

		If(
			Players In Slot(Slot Of(Event Player), Team 1).p_KillGoal != 1 &&
			Players In Slot(Slot Of(Event Player), Team 1).p_KillGoal != Global.c_PseudoInfinity
		);
			Players In Slot(Slot Of(Event Player), Team 1).p_BotTPDistance = Array();
			Players In Slot(Slot Of(Event Player), Team 1).p_BotTPDistance[0] = (
				Players In Slot(Slot Of(Event Player), Team 1).p_KillGoal - 1
				- Players In Slot(Slot Of(Event Player), Team 1).all_Kills
			) % (Players In Slot(Slot Of(Event Player), Team 1).p_KillGoal / 2)
			* Players In Slot(Slot Of(Event Player), Team 1).p_EnemyDistanceMod;
			Players In Slot(Slot Of(Event Player), Team 1).p_BotTPDistance[1] = 
				Players In Slot(Slot Of(Event Player), Team 1).p_BotTPDistance[0]
				+ Players In Slot(Slot Of(Event Player), Team 1).p_EnemyDistanceMod;

			If(
				Players In Slot(Slot Of(Event Player), Team 1).all_Kills == 0 ||
				Players In Slot(Slot Of(Event Player), Team 1).all_Kills == 
					Players In Slot(Slot Of(Event Player), Team 1).p_KillGoal / 2
			);
				Players In Slot(Slot Of(Event Player), Team 1).p_BotTPDistance[1] =
					Players In Slot(Slot Of(Event Player), Team 1).p_BotTPDistance[1] - 2.500;
			End;
			Call Subroutine(allSub_WaitForFrame);

			Teleport(
				Players In Slot(Slot Of(Event Player), Team 2),
				Direction From Angles(Random Integer(1, 360), 0)
				* Random Integer(
					Players In Slot(Slot Of(Event Player), Team 1).p_BotTPDistance[0], 
					Players In Slot(Slot Of(Event Player), Team 1).p_BotTPDistance[1]
				)
				+ Players In Slot(Slot Of(Event Player), Team 1).p_HomeVector
			);

		Else;
			Call Subroutine(allSub_WaitForFrame);
			Teleport(
				Players In Slot(Slot Of(Event Player), Team 2),
				Direction From Angles(Random Integer(1, 360), 0)
				* Random Real(0, Players In Slot(Slot Of(Event Player), Team 1).p_EnemyDistanceMax)
				+ Players In Slot(Slot Of(Event Player), Team 1).p_HomeVector
			);
		End;
		Call Subroutine(allSub_WaitForFrame);

		Play Effect(
			Players In Slot(Slot Of(Event Player), Team 1),
			Buff Impact Sound,
			Color(White),
			Players In Slot(Slot Of(Event Player), Team 2),
			180
		);
		Call Subroutine(allSub_WaitForFrame);

		Play Effect(
			Players In Slot(Slot Of(Event Player), Team 1),
			Bad Pickup Effect,
			Color(White),
			Players In Slot(Slot Of(Event Player), Team 2),
			1
		);
		Call Subroutine(allSub_WaitForFrame);

		Set Invisible(Players In Slot(Slot Of(Event Player), Team 2), None);
	}
}

rule("botSub_MoveWASD")
{
	event
	{
		Subroutine;
		botSub_MoveWASD;
	}

	actions
	{
		Start Throttle In Direction(
			Players In Slot(Slot Of(Event Player), Team 2),
			Players In Slot(Slot Of(Event Player), Team 2).bot_ThrottleDir,
			1,
			To Player,
			Replace existing throttle,
			None
		);
		Wait(
			Random Real(
				Players In Slot(Slot Of(Event Player), Team 2).bot_MoveWASDTimeMod
				/ Players In Slot(Slot Of(Event Player), Team 1).p_Difficulty,
				Players In Slot(Slot Of(Event Player), Team 2).bot_MoveWASDTimeMod
			),
			Ignore Condition
		);
	}
}

rule("botSub_MoveCrouch")
{
	event
	{
		Subroutine;
		botSub_MoveCrouch;
	}

	actions
	{
		Call Subroutine(aiSub_ReactionDelay);
		If(Random Real(0, 1) < Players In Slot(Slot Of(Event Player), Team 2).bot_MoveCrouchChanceMod);
			Stop Holding Button(Players In Slot(Slot Of(Event Player), Team 2), Button(Crouch));
			Start Holding Button(Players In Slot(Slot Of(Event Player), Team 2), Button(Crouch));
			Wait(
				Random Real(
					Players In Slot(Slot Of(Event Player), Team 2).bot_MoveCrouchTimeMod / 5,
					Players In Slot(Slot Of(Event Player), Team 2).bot_MoveCrouchTimeMod
				),
				Ignore Condition
			);
		End;
		Stop Holding Button(Players In Slot(Slot Of(Event Player), Team 2), Button(Crouch));
	}
}

rule("botSub_MoveJump")
{
	event
	{
		Subroutine;
		botSub_MoveJump;
	}

	actions
	{
		If(Hero Of(Players In Slot(Slot Of(Event Player), Team 2)) == Hero(Genji));
			If(Random Real(0, 1) < Players In Slot(Slot Of(Event Player), Team 2).bot_MoveJumpChanceMod * 2.500);
				Press Button(Players In Slot(Slot Of(Event Player), Team 2), Button(Jump));
			End;
		Else;
			If(Random Real(0, 1) < Players In Slot(Slot Of(Event Player), Team 2).bot_MoveJumpChanceMod);
				Press Button(Players In Slot(Slot Of(Event Player), Team 2), Button(Jump));
			End;
		End;
		Wait(
			Random Real(
				Players In Slot(Slot Of(Event Player), Team 2).bot_MoveJumpTimeMod / 5,
				Players In Slot(Slot Of(Event Player), Team 2).bot_MoveJumpTimeMod
			),
			Ignore Condition
		);
	}
}

rule("botSub_ThrottleStop")
{
	event
	{
		Subroutine;
		botSub_ThrottleStop;
	}

	actions
	{
		"Wait 4 frames before"
		Wait(4 / 60, Ignore Condition);
		Stop Throttle In Direction(Players In Slot(Slot Of(Event Player), Team 2));
	}
}

