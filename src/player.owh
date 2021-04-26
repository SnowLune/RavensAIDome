rule("pSub_SetDifficulty")
{
	event
	{
		Subroutine;
		pSub_SetDifficulty;
	}

	actions
	{
		Players In Slot(Slot Of(Event Player), Team 2).ai_ChanceMod = Players In Slot(Slot Of(Event Player), Team 1).p_Difficulty / 100;
		Players In Slot(Slot Of(Event Player), Team 2).ai_FacingAngleMod = 150 + 5 * Players In Slot(Slot Of(Event Player), Team 1)
			.p_Difficulty;
		Players In Slot(Slot Of(Event Player), Team 2).ai_FacingAnglePow = 0.225 + 0.005 * Players In Slot(Slot Of(Event Player), Team 1)
			.p_Difficulty;
		Players In Slot(Slot Of(Event Player), Team 2).ai_FacingCapMax = 540 + 18 * Players In Slot(Slot Of(Event Player), Team 1)
			.p_Difficulty;
		Players In Slot(Slot Of(Event Player), Team 2).ai_FacingCapMin = 540 + 9 * Players In Slot(Slot Of(Event Player), Team 1)
			.p_Difficulty;
		Players In Slot(Slot Of(Event Player), Team 2).ai_FacingPadMax = 200 + 5 * Players In Slot(Slot Of(Event Player), Team 1)
			.p_Difficulty;
		Players In Slot(Slot Of(Event Player), Team 2).ai_FacingPadMin = 150 + 5 * Players In Slot(Slot Of(Event Player), Team 1)
			.p_Difficulty;
		Players In Slot(Slot Of(Event Player), Team 2).ai_ReactionTime = 0.250 + 0.050 * (Global.difficultyMax - Players In Slot(Slot Of(
			Event Player), Team 1).p_Difficulty);
		Players In Slot(Slot Of(Event Player), Team 2).ai_ViewAngleMod = (Global.difficultyMax - Players In Slot(Slot Of(Event Player),
			Team 1).p_Difficulty) / 2;
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
	}
}

rule("pSub_SetHeroClass")
{
	event
	{
		Subroutine;
		pSub_SetHeroClass;
	}

	actions
	{
		If(Array Contains(All Heroes, Global.g_DebugHero[1]));
			Players In Slot(Slot Of(Event Player), Team 1).p_KillGoal = Global.pseudoInfinity;
			Players In Slot(Slot Of(Event Player), Team 1).p_HeroList = Array(Global.g_DebugHero[1]);
			Players In Slot(Slot Of(Event Player), Team 1).p_HeroListName = Global.g_DebugHero[1];
		Else;
			If(Players In Slot(Slot Of(Event Player), Team 1).p_HeroListName != Players In Slot(Slot Of(Event Player), Team 1)
				.p_HeroClassNames[Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroClass]);
				Players In Slot(Slot Of(Event Player), Team 1).p_HeroList = Randomized Array(Global.heroClasses[Players In Slot(Slot Of(
					Event Player), Team 1).p_BotHeroClass]);
				Players In Slot(Slot Of(Event Player), Team 1).p_HeroListName = Players In Slot(Slot Of(Event Player), Team 1)
					.p_HeroClassNames[Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroClass];
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
		Players In Slot(Slot Of(Event Player), Team 1).p_DifficultyNames = Empty Array;
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
		Players In Slot(Slot Of(Event Player), Team 1).p_HeroClassNames = Empty Array;
		Players In Slot(Slot Of(Event Player), Team 1).p_HeroClassNames[0] = Players In Slot(Slot Of(Event Player), Team 1)
			.p_Language == 1 ? Custom String("모든") : Custom String("All");
		Players In Slot(Slot Of(Event Player), Team 1).p_HeroClassNames[1] = Players In Slot(Slot Of(Event Player), Team 1)
			.p_Language == 1 ? Custom String("돌격") : Custom String("Tank");
		Players In Slot(Slot Of(Event Player), Team 1).p_HeroClassNames[2] = Players In Slot(Slot Of(Event Player), Team 1)
			.p_Language == 1 ? Custom String("공격") : Custom String("Damage");
		Players In Slot(Slot Of(Event Player), Team 1).p_HeroClassNames[3] = Players In Slot(Slot Of(Event Player), Team 1)
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
		Players In Slot(Slot Of(Event Player), Team 1).p_ZoneRadius = Global.playerZoneRadiusDefault;
		If(Array Contains(Global.longRangeHeroes, Hero Of(Players In Slot(Slot Of(Event Player), Team 1))) == True);
			Players In Slot(Slot Of(Event Player), Team 1).p_EnemyDistanceMax = Global.longDistance;
		Else If(Array Contains(Global.mediumRangeHeroes, Hero Of(Players In Slot(Slot Of(Event Player), Team 1))) == True);
			Players In Slot(Slot Of(Event Player), Team 1).p_EnemyDistanceMax = Global.mediumDistance;
		Else If(Array Contains(Global.shortRangeHeroes, Hero Of(Players In Slot(Slot Of(Event Player), Team 1))) == True);
			Players In Slot(Slot Of(Event Player), Team 1).p_EnemyDistanceMax = Global.shortDistance;
		Else If(Array Contains(Global.largePlayerZoneHeroes, Hero Of(Players In Slot(Slot Of(Event Player), Team 1))) == True);
			Players In Slot(Slot Of(Event Player), Team 1).p_EnemyDistanceMax = Global.shortDistance;
			Players In Slot(Slot Of(Event Player), Team 1).p_ZoneRadius = Players In Slot(Slot Of(Event Player), Team 1).p_EnemyDistanceMax;
		Else If(Array Contains(Global.veryShortRangeHeroes, Hero Of(Players In Slot(Slot Of(Event Player), Team 1))) == True);
			Players In Slot(Slot Of(Event Player), Team 1).p_EnemyDistanceMax = Global.veryShortDistance;
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
		Event Player.p_ElevatorPosition = Empty Array;
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

