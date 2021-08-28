rule("pSub_SetDifficulty")
{
	event
	{
		Subroutine;
		pSub_SetDifficulty;
	}

	actions
	{
		If(Event Player.p_Difficulty == 3);
		Else If(Event Player.p_Difficulty == 4);
		Else If(Event Player.p_Difficulty == 5);
		Else If(Event Player.p_Difficulty == 6);
		Else If(Event Player.p_Difficulty == 7);
		Else If(Event Player.p_Difficulty == 8);
		Else If(Event Player.p_Difficulty == 9);
		Else If(Event Player.p_Difficulty == 10);
		End;

		Players In Slot(Slot Of(Event Player), Team 2).ai_ChanceMod = Players In Slot(Slot Of(Event Player), Team 1).p_Difficulty / 25;
		Players In Slot(Slot Of(Event Player), Team 2).ai_FacingAngleMod = 150 + 10 * Players In Slot(Slot Of(Event Player), Team 1)
			.p_Difficulty;
		Players In Slot(Slot Of(Event Player), Team 2).ai_FacingAnglePow = 0.225 + 0.005 * Players In Slot(Slot Of(Event Player), Team 1)
			.p_Difficulty;
		Players In Slot(Slot Of(Event Player), Team 2).ai_FacingCapMax = 540 + 18 * Players In Slot(Slot Of(Event Player), Team 1)
			.p_Difficulty;
		Players In Slot(Slot Of(Event Player), Team 2).ai_FacingCapMin = 540 + 9 * Players In Slot(Slot Of(Event Player), Team 1)
			.p_Difficulty;
		Players In Slot(Slot Of(Event Player), Team 2).ai_FacingPadMax = 300 + 5 * Players In Slot(Slot Of(Event Player), Team 1)
			.p_Difficulty;
		Players In Slot(Slot Of(Event Player), Team 2).ai_FacingPadMin = 200 + 5 * Players In Slot(Slot Of(Event Player), Team 1)
			.p_Difficulty;
		Players In Slot(Slot Of(Event Player), Team 2).ai_ReactionTime = 0.250 + 0.050 * (Global.c_MaxDifficulty - Players In Slot(Slot Of(
			Event Player), Team 1).p_Difficulty);
		Players In Slot(Slot Of(Event Player), Team 2).bot_MoveCrouchChanceMod = 0.100 + Players In Slot(Slot Of(Event Player), Team 1)
			.p_Difficulty * 0.010;
		Players In Slot(Slot Of(Event Player), Team 2).bot_MoveCrouchTimeMod = 0.080 * Players In Slot(Slot Of(Event Player), Team 1)
			.p_Difficulty;
		Players In Slot(Slot Of(Event Player), Team 2).bot_MoveJumpChanceMod = 0.160 + Players In Slot(Slot Of(Event Player), Team 1)
			.p_Difficulty * 0.030;
		Players In Slot(Slot Of(Event Player), Team 2).bot_MoveJumpTimeMod = 1 + Players In Slot(Slot Of(Event Player), Team 1)
			.p_Difficulty * 0.070;
		Players In Slot(Slot Of(Event Player), Team 2).bot_MoveWASDTimeMod = 2 - 0.100 * Players In Slot(Slot Of(Event Player), Team 1)
			.p_Difficulty;
		If(Players In Slot(Slot Of(Event Player), Team 1).p_Difficulty < 3);
			Clear Status(Players In Slot(Slot Of(Event Player), Team 2), Unkillable);
		End;
	}
}

rule("pSub_SetHeroRole")
{
	event
	{
		Subroutine;
		pSub_SetHeroRole;
	}

	actions
	{
		If(Array Contains(All Heroes, Global.g_DebugHero[1]));
			Players In Slot(Slot Of(Event Player), Team 1).p_KillGoal = Global.c_PseudoInfinity;
			Players In Slot(Slot Of(Event Player), Team 1).p_HeroList = Array(Global.g_DebugHero[1]);
			Players In Slot(Slot Of(Event Player), Team 1).p_HeroListName = Global.g_DebugHero[1];
		Else;
			If(Players In Slot(Slot Of(Event Player), Team 1).p_HeroListName != Players In Slot(Slot Of(Event Player), Team 1)
				.p_HeroRoleNames[Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroRole]);
				Players In Slot(Slot Of(Event Player), Team 1).p_HeroList = Randomized Array(Global.c_HeroRoles[Players In Slot(Slot Of(
					Event Player), Team 1).p_BotHeroRole]);
				Players In Slot(Slot Of(Event Player), Team 1).p_HeroListName = Players In Slot(Slot Of(Event Player), Team 1)
					.p_HeroRoleNames[Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroRole];
			End;
		End;
	}
}

rule("Player Set Language")
{
	event
	{
		Subroutine;
		pSub_SetLanguage;
	}

	actions
	{
		If(Event Player.p_Language == 1);
			Modify Global Variable(hud_MainVisibleToEN, Remove From Array By Value, Event Player);
			Modify Global Variable(hud_MainVisibleToKR, Append To Array, Event Player);
		Else;
			Modify Global Variable(hud_MainVisibleToKR, Remove From Array By Value, Event Player);
			Modify Global Variable(hud_MainVisibleToEN, Append To Array, Event Player);
		End;
	}
}

rule("Player Set Names")
{
	event
	{
		Subroutine;
		pSub_SetNames;
	}

	actions
	{
		Players In Slot(Slot Of(Event Player), Team 1).p_DifficultyNames = Array();
		Players In Slot(Slot Of(Event Player), Team 1).p_DifficultyNames[0] = Players In Slot(Slot Of(Event Player), Team 1)
			.p_Language == 1 ? Custom String("안전하고 쉬움") : Custom String("No AI Easy");
		Players In Slot(Slot Of(Event Player), Team 1).p_DifficultyNames[1] = Players In Slot(Slot Of(Event Player), Team 1)
			.p_Language == 1 ? Custom String("안전하고 중간") : Custom String("No AI Medium");
		Players In Slot(Slot Of(Event Player), Team 1).p_DifficultyNames[2] = Players In Slot(Slot Of(Event Player), Team 1)
			.p_Language == 1 ? Custom String("안전하고 곤란한") : Custom String("No AI Hard");
		Players In Slot(Slot Of(Event Player), Team 1).p_DifficultyNames[3] = Players In Slot(Slot Of(Event Player), Team 1)
			.p_Language == 1 ? Custom String("인공지능 브론즈") : Custom String("AI Bronze");
		Players In Slot(Slot Of(Event Player), Team 1).p_DifficultyNames[4] = Players In Slot(Slot Of(Event Player), Team 1)
			.p_Language == 1 ? Custom String("인공지능 실버") : Custom String("AI Silver");
		Players In Slot(Slot Of(Event Player), Team 1).p_DifficultyNames[5] = Players In Slot(Slot Of(Event Player), Team 1)
			.p_Language == 1 ? Custom String("인공지능 골드") : Custom String("AI Gold");
		Players In Slot(Slot Of(Event Player), Team 1).p_DifficultyNames[6] = Players In Slot(Slot Of(Event Player), Team 1)
			.p_Language == 1 ? Custom String("인공지능 플래티넘") : Custom String("AI Platinum");
		Players In Slot(Slot Of(Event Player), Team 1).p_DifficultyNames[7] = Players In Slot(Slot Of(Event Player), Team 1)
			.p_Language == 1 ? Custom String("인공지능 다이아몬드") : Custom String("AI Diamond");
		Players In Slot(Slot Of(Event Player), Team 1).p_DifficultyNames[8] = Players In Slot(Slot Of(Event Player), Team 1)
			.p_Language == 1 ? Custom String("인공지능 마스터") : Custom String("AI Master");
		Players In Slot(Slot Of(Event Player), Team 1).p_DifficultyNames[9] = Players In Slot(Slot Of(Event Player), Team 1)
			.p_Language == 1 ? Custom String("인공지능 그랜드마스터") : Custom String("AI Grandmaster");
		Players In Slot(Slot Of(Event Player), Team 1).p_DifficultyNames[10] = Players In Slot(Slot Of(Event Player), Team 1)
			.p_Language == 1 ? Custom String("인공지능 상위500위") : Custom String("AI Top 500");
		Players In Slot(Slot Of(Event Player), Team 1).p_HeroRoleNames = Array();
		Players In Slot(Slot Of(Event Player), Team 1).p_HeroRoleNames[0] = Players In Slot(Slot Of(Event Player), Team 1)
			.p_Language == 1 ? Custom String("모든") : Custom String("All");
		Players In Slot(Slot Of(Event Player), Team 1).p_HeroRoleNames[1] = Players In Slot(Slot Of(Event Player), Team 1)
			.p_Language == 1 ? Custom String("돌격") : Custom String("Tank");
		Players In Slot(Slot Of(Event Player), Team 1).p_HeroRoleNames[2] = Players In Slot(Slot Of(Event Player), Team 1)
			.p_Language == 1 ? Custom String("공격") : Custom String("Damage");
		Players In Slot(Slot Of(Event Player), Team 1).p_HeroRoleNames[3] = Players In Slot(Slot Of(Event Player), Team 1)
			.p_Language == 1 ? Custom String("지원") : Custom String("Support");
	}
}

rule("Player Set Distances")
{
	event
	{
		Subroutine;
		pSub_SetDistances;
	}

	actions
	{
		Players In Slot(Slot Of(Event Player), Team 1).p_ZoneRadius = Global.c_ZoneRadiusDefault;
		If(Array Contains(Global.c_LongRangeHeroes, Hero Of(Players In Slot(Slot Of(Event Player), Team 1))) == True);
			Players In Slot(Slot Of(Event Player), Team 1).p_EnemyDistanceMax = Global.c_LongDistance;
		Else If(Array Contains(Global.c_MediumRangeHeroes, Hero Of(Players In Slot(Slot Of(Event Player), Team 1))) == True);
			Players In Slot(Slot Of(Event Player), Team 1).p_EnemyDistanceMax = Global.c_MediumDistance;
		Else If(Array Contains(Global.c_ShortRangeHeroes, Hero Of(Players In Slot(Slot Of(Event Player), Team 1))) == True);
			Players In Slot(Slot Of(Event Player), Team 1).p_EnemyDistanceMax = Global.c_ShortDistance;
		Else If(Array Contains(Global.c_LargeZoneHeroes, Hero Of(Players In Slot(Slot Of(Event Player), Team 1))) == True);
			Players In Slot(Slot Of(Event Player), Team 1).p_EnemyDistanceMax = Global.c_ShortDistance;
			Players In Slot(Slot Of(Event Player), Team 1).p_ZoneRadius = Players In Slot(Slot Of(Event Player), Team 1).p_EnemyDistanceMax;
		Else If(Array Contains(Global.c_VeryShortRangeHeroes, Hero Of(Players In Slot(Slot Of(Event Player), Team 1))) == True);
			Players In Slot(Slot Of(Event Player), Team 1).p_EnemyDistanceMax = Global.c_VeryShortDistance;
			Players In Slot(Slot Of(Event Player), Team 1).p_ZoneRadius = Players In Slot(Slot Of(Event Player), Team 1).p_EnemyDistanceMax;
		End;
	}
}

rule("pSub_QuickMode")
{
	event
	{
		Subroutine;
		pSub_QuickMode;
	}

	actions
	{
		If(Event Player.p_QuickModeEnabled);
			Event Player.p_KillGoal = Global.g_KillGoal;
			Event Player.p_QuickModeEnabled = False;
		Else;
			Event Player.all_Kills = 0;
			Event Player.p_KillGoal = 1;
			Event Player.p_QuickModeEnabled = True;
		End;
	}
}

rule("pSub_Elevator")
{
	event
	{
		Subroutine;
		pSub_Elevator;
	}

	actions
	{
		Start Forcing Throttle(Event Player, 0, 0, 0, 0, 0, 0);
		Stop Chasing Player Variable(Event Player, p_ElevatorHeight);
		Start Forcing Player Position(Event Player, Vector(X Component Of(Event Player.p_HomeVector), Event Player.p_ElevatorHeight,
			Z Component Of(Event Player.p_HomeVector)), True);
		Chase Player Variable Over Time(Event Player, p_ElevatorHeight, (Event Player.all_SubArg[0] == 1 ? 2 : -2)
			+ Event Player.p_ElevatorHeight - Event Player.p_ElevatorHeight % 2, 0.250, None);
		Wait(0.250, Ignore Condition);
		Loop If Condition Is True;
		Wait(0.250, Ignore Condition);
		Stop Forcing Player Position(Event Player);
		Stop Forcing Throttle(Event Player);
		Event Player.p_ElevatorPosition = Array();
		Event Player.p_ElevatorPosition[0] = Position Of(Event Player);
		Wait(0.100, Ignore Condition);
		Event Player.p_ElevatorPosition[1] = Position Of(Event Player);
		Apply Impulse(Event Player, Direction Towards(Event Player.p_ElevatorPosition[1], Event Player.p_ElevatorPosition[0]),
			Speed Of In Direction(Event Player, Direction Towards(Event Player.p_ElevatorPosition[0], Event Player.p_ElevatorPosition[1])),
			To World, Incorporate Contrary Motion);
		Small Message(Event Player, Players In Slot(Slot Of(Event Player), Team 1).p_Language == 1 ? Custom String("높이: {0} 미터",
			Event Player.p_ElevatorHeight) : Custom String("Height: {0} Meters", Event Player.p_ElevatorHeight));
	}
}

rule("pSub_SetInvulnerable")
{
	event
	{
		Subroutine;
		pSub_SetInvulnerable;
	}

	actions
	{
		Clear Status(Event Player, Unkillable);
		Clear Status(Event Player, Phased Out);
		Clear Status(Event Player, Invincible);

		If(Event Player.p_Invulnerable == 1);
			Set Status(Event Player, Null, Unkillable, Global.c_PseudoInfinity);
		Else If(Event Player.p_Invulnerable == 2);
			Set Status(Event Player, Null, Phased Out, Global.c_PseudoInfinity);
		Else If(Event Player.p_Invulnerable == 3);
			Set Status(Event Player, Null, Invincible, Global.c_PseudoInfinity);
		End;
	}
}

rule("pSub_SetPreset")
{
	event
	{
		Subroutine;
		pSub_SetPreset;
	}

	actions
	{
		// None
		If(Event Player.p_Preset == 0);
			Event Player.p_PresetName = Global.c_PresetNames[Event Player.p_Preset];
			Event Player.p_KillGoal = Global.g_KillGoal;
			Event Player.p_KillsLostOnDeath = 0;
			Event Player.p_OneSecCooldown = 0;

			Small Message(Event Player, Custom String("Preset Cleared"));

		// Widow 1v1
		Else If(Event Player.p_Preset == 1);
			If(Event Player.p_BotHeroRole != 0);
				Event Player.p_BotHeroRole = 0;
				Call Subroutine(pSub_SetHeroRole);
			End;

			Event Player.p_BotHeroNumber = Index Of Array Value(Event Player.p_HeroList, Hero(Widowmaker));
			Call Subroutine(botSub_SetHero);

			If(Hero Of(Event Player) != Hero(Widowmaker));
				Start Forcing Player To Be Hero(Event Player, Hero(Widowmaker));
				Stop Forcing Player To Be Hero(Event Player);
			End;

			Event Player.p_OneSecCooldown = 0;
			Event Player.p_KillGoal = Global.c_PseudoInfinity;

			Small Message(Event Player, Custom String("Preset: Widowmaker 1v1"));

		// Reinhardt 1v1
		Else If(Event Player.p_Preset == 2);
			If(Event Player.p_BotHeroRole != 0);
				Event Player.p_BotHeroRole = 0;
				Call Subroutine(pSub_SetHeroRole);
			End;

			Event Player.p_BotHeroNumber = Index Of Array Value(Event Player.p_HeroList, Hero(Reinhardt));
			Call Subroutine(botSub_SetHero);

			If(Hero Of(Event Player) != Hero(Reinhardt));
				Start Forcing Player To Be Hero(Event Player, Hero(Reinhardt));
				Stop Forcing Player To Be Hero(Event Player);
			End;

			Event Player.p_OneSecCooldown = 0;
			Event Player.p_KillsLostOnDeath = 2;
			Event Player.p_KillGoal = 32;

			Small Message(Event Player, Custom String("Preset: Reinhardt 1v1"));

		// Roadhog Hook Practice
		Else If(Event Player.p_Preset == 3);
			If(Hero Of(Event Player) != Hero(Roadhog));
				Start Forcing Player To Be Hero(Event Player, Hero(Roadhog));
				Stop Forcing Player To Be Hero(Event Player);
			End;

			Event Player.p_OneSecCooldown = 1;
			Event Player.p_KillGoal = Global.g_KillGoal;

			Small Message(Event Player, Custom String("Preset: Roadhog Low Cooldown"));

		// Ana Sleep Practice
		Else If(Event Player.p_Preset == 4);
			If(Hero Of(Event Player) != Hero(Ana));
				Start Forcing Player To Be Hero(Event Player, Hero(Ana));
				Stop Forcing Player To Be Hero(Event Player);
			End;

			Event Player.p_OneSecCooldown = 1;
			Event Player.p_KillGoal = Global.g_KillGoal;

			Small Message(Event Player, Custom String("Preset: Ana Low Cooldown"));
		
		// Hard and Thorough
		Else If(Event Player.p_Preset == 5);
			Event Player.p_KillGoal = 8;
			Event Player.p_KillsLostOnDeath = 2;
			Event Player.p_HealingEnabled = True;
			Event Player.p_BotHealingEnabled = True;
			Event Player.p_OneSecCooldown = 0;

			Event Player.p_Difficulty = 9;
			Call Subroutine(pSub_SetDifficulty);

			Small Message(Event Player, Custom String("Preset: Hard and Thorough"));
		End;

		Call Subroutine(pSub_SetDistances);
	}
}

