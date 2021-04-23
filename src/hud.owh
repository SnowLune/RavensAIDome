rule("hudSub_DebugToggle")
{
	event
	{
		Subroutine;
		hudSub_DebugToggle;
	}

	actions
	{
		If(Count Of(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenu) > 0);
			Call Subroutine(hudSub_SkyMenuToggle);
		End;
		If(Count Of(Players In Slot(Slot Of(Event Player), Team 1).hud_Info) > 0);
			Call Subroutine(hudSub_InfoToggle);
		End;
		If(Count Of(Players In Slot(Slot Of(Event Player), Team 1).hud_Main) > 0);
			Call Subroutine(hudSub_MainToggle);
		End;
		Wait(3 / 60, Ignore Condition);
		If(Count Of(Players In Slot(Slot Of(Event Player), Team 1).hud_Debug) > 0);
			For Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_i, Count Of(Players In Slot(Slot Of(Event Player), Team 1)
				.hud_Debug), -1, -1);
				Destroy HUD Text(Players In Slot(Slot Of(Event Player), Team 1).hud_Debug[Players In Slot(Slot Of(Event Player), Team 1).hud_i]);
				Players In Slot(Slot Of(Event Player), Team 1).hud_Debug = Remove From Array(Players In Slot(Slot Of(Event Player), Team 1)
					.hud_Debug, Players In Slot(Slot Of(Event Player), Team 1).hud_Debug[Players In Slot(Slot Of(Event Player), Team 1).hud_i]);
			End;
			Players In Slot(Slot Of(Event Player), Team 1).hud_DebugEnabled = False;
			If(Count Of(Players In Slot(Slot Of(Event Player), Team 1).hud_Main) <= 0);
				Call Subroutine(hudSub_MainToggle);
			End;
		Else;
			Players In Slot(Slot Of(Event Player), Team 1).hud_Debug = Empty Array;
			Players In Slot(Slot Of(Event Player), Team 1).hud_DebugEnabled = True;
			Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Custom String("Server Load: {0}% ({1})", Round To Integer(
				Server Load / 2.550, Down), Server Load), Custom String("Average: {0}% ({1})", Round To Integer(Server Load Average / 2.550,
				Down), Server Load Average), Custom String("Peak: {0}% ({1})", Round To Integer(Server Load Peak / 2.550, Down),
				Server Load Peak), Top, 100, Global.colorLightPink, Global.colorLightTeal, Global.colorDarkTeal, Visible To and String,
				Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_Debug, Append To Array, Last Text ID);
			Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Null, Custom String("Enemy Pos: {0}", Position Of(Players In Slot(
				Slot Of(Event Player), Team 2))), Custom String("Player Pos: {0}", Position Of(Event Player)), Left, 4, Color(White),
				Global.colorLightPink, Global.colorLightTeal, Visible To and String, Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_Debug, Append To Array, Last Text ID);
			Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Null, Custom String("Enemy Dist From Home: {0}", Distance Between(
				Players In Slot(Slot Of(Event Player), Team 2), Players In Slot(Slot Of(Event Player), Team 1).p_HomeVector)), Custom String(
				"Player Dist From Home: {0}", Distance Between(Players In Slot(Slot Of(Event Player), Team 1), Players In Slot(Slot Of(
				Event Player), Team 1).p_HomeVector)), Left, 5, Color(White), Global.colorLightPink, Global.colorLightTeal,
				Visible To and String, Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_Debug, Append To Array, Last Text ID);
			Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Custom String("Enemy Distance From Player: {0}", Distance Between(
				Players In Slot(Slot Of(Event Player), Team 1), Players In Slot(Slot Of(Event Player), Team 2))), Null, Null, Left, 5.200,
				Global.colorLightPink, Color(White), Color(White), Visible To and String, Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_Debug, Append To Array, Last Text ID);
			Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Custom String("Enemy Ult Charge: {0}", Ultimate Charge Percent(
				Players In Slot(Slot Of(Event Player), Team 2))), Null, Null, Right, 6, Global.colorLightGrey, Color(White), Color(White),
				Visible To and String, Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_Debug, Append To Array, Last Text ID);
			Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Custom String("Player Facing Dir: {0}", Facing Direction Of(
				Event Player)), Null, Custom String("Enemy Facing Dir: {0}", Facing Direction Of(Players In Slot(Slot Of(Event Player),
				Team 2))), Left, 6.100, Global.colorLightTeal, Color(White), Global.colorLightPink, Visible To and String, Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_Debug, Append To Array, Last Text ID);
		End;
	}
}

rule("hudSub_InfoToggle")
{
	event
	{
		Subroutine;
		hudSub_InfoToggle;
	}

	actions
	{
		If(Count Of(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenu) > 0);
			Call Subroutine(hudSub_SkyMenuToggle);
		End;
		If(Count Of(Players In Slot(Slot Of(Event Player), Team 1).hud_Debug) > 0);
			Call Subroutine(hudSub_DebugToggle);
		End;
		Wait(3 / 60, Ignore Condition);
		If(Players In Slot(Slot Of(Event Player), Team 1).hud_InfoEnabled == True);
			Modify Global Variable(hud_InfoVisibleToEN, Remove From Array By Value, Event Player);
			Modify Global Variable(hud_InfoVisibleToKR, Remove From Array By Value, Event Player);
			Players In Slot(Slot Of(Event Player), Team 1).hud_InfoEnabled = False;
		Else;
			If(Players In Slot(Slot Of(Event Player), Team 1).p_Language == 1);
				Modify Global Variable(hud_InfoVisibleToEN, Remove From Array By Value, Event Player);
				Modify Global Variable(hud_InfoVisibleToKR, Append To Array, Event Player);
			Else;
				Modify Global Variable(hud_InfoVisibleToKR, Remove From Array By Value, Event Player);
				Modify Global Variable(hud_InfoVisibleToEN, Append To Array, Event Player);
			End;
			Players In Slot(Slot Of(Event Player), Team 1).hud_InfoEnabled = True;
			"Auto-close after 20 seconds open"
			Wait(20, Ignore Condition);
			If(Event Player.hud_InfoEnabled == True);
				Call Subroutine(hudSub_InfoToggle);
			End;
		End;
	}
}

rule("hudSub_MainToggle")
{
	event
	{
		Subroutine;
		hudSub_MainToggle;
	}

	actions
	{
		If(Count Of(Players In Slot(Slot Of(Event Player), Team 1).hud_Main) > 0);
			For Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_i, Count Of(Players In Slot(Slot Of(Event Player), Team 1)
				.hud_Main), -1, -1);
				Destroy HUD Text(Players In Slot(Slot Of(Event Player), Team 1).hud_Main[Players In Slot(Slot Of(Event Player), Team 1).hud_i]);
				Players In Slot(Slot Of(Event Player), Team 1).hud_Main = Remove From Array(Players In Slot(Slot Of(Event Player), Team 1)
					.hud_Main, Players In Slot(Slot Of(Event Player), Team 1).hud_Main[Players In Slot(Slot Of(Event Player), Team 1).hud_i]);
			End;
		Else;
			Wait(3 / 60, Ignore Condition);
			Players In Slot(Slot Of(Event Player), Team 1).hud_Main = Empty Array;
			"Create Right Side HUD Text"
			Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Players In Slot(Slot Of(Event Player), Team 1)
				.p_Language == 1 ? Custom String("{0} 킬: {1} / {2}", Hero Icon String(Players In Slot(Slot Of(Event Player), Team 1)
				.p_HeroList[Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumber]), Players In Slot(Slot Of(Event Player), Team 1)
				.all_Kills, Players In Slot(Slot Of(Event Player), Team 1).p_KillGoal == Global.pseudoInfinity ? Custom String("무한")
				: Players In Slot(Slot Of(Event Player), Team 1).p_KillGoal) : Custom String("{0} Kills: {1} / {2}", Hero Icon String(
				Players In Slot(Slot Of(Event Player), Team 1).p_HeroList[Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumber]),
				Players In Slot(Slot Of(Event Player), Team 1).all_Kills, Players In Slot(Slot Of(Event Player), Team 1)
				.p_KillGoal == Global.pseudoInfinity ? Custom String("Infinite") : Players In Slot(Slot Of(Event Player), Team 1).p_KillGoal),
				Null, Null, Right, -3, Color(White), Color(White), Color(White), Visible To and String, Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_Main, Append To Array, Last Text ID);
			Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Null, Players In Slot(Slot Of(Event Player), Team 1)
				.p_Language == 1 ? Custom String("{0} 당신을 {1} 번 죽였습니다", Hero Of(Players In Slot(Slot Of(Event Player), Team 2)),
				Players In Slot(Slot Of(Event Player), Team 2).all_Kills) : Custom String("{0} killed you {1} time(s).", Hero Of(
				Players In Slot(Slot Of(Event Player), Team 2)), Players In Slot(Slot Of(Event Player), Team 2).all_Kills), Null, Right,
				-2.900, Color(White), Global.colorLightPink, Color(Red), Visible To and String, Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_Main, Append To Array, Last Text ID);
			Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Null, Players In Slot(Slot Of(Event Player), Team 1)
				.p_Language == 1 ? Custom String("영웅 유형: {0}", Players In Slot(Slot Of(Event Player), Team 1).p_HeroListName) : Custom String(
				"Hero Type: {0}", Players In Slot(Slot Of(Event Player), Team 1).p_HeroListName), Players In Slot(Slot Of(Event Player),
				Team 1).p_Language == 1 ? Custom String("영웅: {0} / {1}", 1 + Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumber,
				Count Of(Players In Slot(Slot Of(Event Player), Team 1).p_HeroList)) : Custom String("Hero: {0} / {1}", 1 + Players In Slot(
				Slot Of(Event Player), Team 1).p_BotHeroNumber, Count Of(Players In Slot(Slot Of(Event Player), Team 1).p_HeroList)), Right,
				-2.200, Color(White), Color(White), Global.colorLightTeal, Visible To and String, Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_Main, Append To Array, Last Text ID);
			Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Null, Players In Slot(Slot Of(Event Player), Team 1)
				.p_Language == 1 ? Custom String("다음 영웅: {0}", Players In Slot(Slot Of(Event Player), Team 1)
				.p_QuickModeEnabled == True ? Custom String("?") : Hero Icon String(Players In Slot(Slot Of(Event Player), Team 1)
				.p_HeroList[Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumberNext])) : Custom String("Next Hero: {0}",
				Players In Slot(Slot Of(Event Player), Team 1).p_QuickModeEnabled == True ? Custom String("?") : Hero Icon String(
				Players In Slot(Slot Of(Event Player), Team 1).p_HeroList[Players In Slot(Slot Of(Event Player), Team 1)
				.p_BotHeroNumberNext])), Null, Right, -2, Color(White), Global.colorDarkTeal, Color(Aqua), Visible To and String,
				Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_Main, Append To Array, Last Text ID);
			Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Null, Players In Slot(Slot Of(Event Player), Team 1)
				.p_Language == 1 ? Custom String("난이도: {0}", Players In Slot(Slot Of(Event Player), Team 1).p_DifficultyNames[Players In Slot(
				Slot Of(Event Player), Team 1).p_Difficulty]) : Custom String("Difficulty: {0}", Players In Slot(Slot Of(Event Player), Team 1)
				.p_DifficultyNames[Players In Slot(Slot Of(Event Player), Team 1).p_Difficulty]), Null, Right, -0.900, Color(White),
				Global.colorLightGrey, Color(White), Visible To and String, Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_Main, Append To Array, Last Text ID);
		End;
	}
}

rule("hudSub_SkyMenuPlaySound")
{
	event
	{
		Subroutine;
		hudSub_SkyMenuPlaySound;
	}

	actions
	{
		"On, Off, Neutral, Other"
		If(Event Player.hud_SkyMenuSound == 0);
			Play Effect(Players In Slot(Slot Of(Event Player), Team 1), Buff Impact Sound, Color(White), Players In Slot(Slot Of(Event Player),
				Team 1).hud_SkyMenuSelection - Vector(0, 15, 0), 20);
		Else If(Event Player.hud_SkyMenuSound == 1);
			Play Effect(Players In Slot(Slot Of(Event Player), Team 1), Debuff Impact Sound, Color(White), Players In Slot(Slot Of(
				Event Player), Team 1).hud_SkyMenuSelection - Vector(0, 15, 0), 20);
		Else If(Event Player.hud_SkyMenuSound == 2);
			Play Effect(Players In Slot(Slot Of(Event Player), Team 1), Explosion Sound, Color(White), Players In Slot(Slot Of(Event Player),
				Team 1).hud_SkyMenuSelection - Vector(0, 15, 0), 15);
		Else;
			Play Effect(Players In Slot(Slot Of(Event Player), Team 1), Explosion Sound, Color(White), Players In Slot(Slot Of(Event Player),
				Team 1).hud_SkyMenuSelection - Vector(0, 15, 0), 10);
		End;
	}
}

rule("hudSub_SkyMenuToggle")
{
	event
	{
		Subroutine;
		hudSub_SkyMenuToggle;
	}

	actions
	{
		If(Players In Slot(Slot Of(Event Player), Team 1).hud_InfoEnabled == True);
			Call Subroutine(hudSub_InfoToggle);
		End;
		If(Count Of(Players In Slot(Slot Of(Event Player), Team 1).hud_Debug) > 0);
			Call Subroutine(hudSub_DebugToggle);
		End;
		If(Count Of(Players In Slot(Slot Of(Event Player), Team 1).hud_Main) > 0);
			Call Subroutine(hudSub_MainToggle);
		End;
		Wait(3 / 60, Ignore Condition);
		If(Count Of(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenu) > 0);
			For Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_i, Count Of(Players In Slot(Slot Of(Event Player), Team 1)
				.hud_SkyMenu), -1, -1);
				Destroy In-World Text(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenu[Players In Slot(Slot Of(Event Player), Team 1)
					.hud_i]);
				Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenu = Remove From Array(Players In Slot(Slot Of(Event Player), Team 1)
					.hud_SkyMenu, Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenu[Players In Slot(Slot Of(Event Player), Team 1)
					.hud_i]);
			End;
			Destroy Effect(Players In Slot(Slot Of(Event Player), Team 1).p_Effects[10]);
			Destroy Effect(Players In Slot(Slot Of(Event Player), Team 1).p_Effects[11]);
			Clear Status(Players In Slot(Slot Of(Event Player), Team 1), Phased Out);
			Stop Forcing Player Position(Players In Slot(Slot Of(Event Player), Team 1));
			Stop Facing(Players In Slot(Slot Of(Event Player), Team 1));
			Call Subroutine(allSub_ButtonsAllow);
			Wait(6 / 60, Ignore Condition);
			Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuIsOpen = False;
			Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVisibleTo = Null;
			Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuArrowsVisibleTo[0] = Null;
			Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuArrowsVisibleTo[1] = Null;
			Stop Camera(Players In Slot(Slot Of(Event Player), Team 1));
			Enable Hero HUD(Players In Slot(Slot Of(Event Player), Team 1));
			Call Subroutine(hudSub_MainToggle);
			If(Players In Slot(Slot Of(Event Player), Team 1).p_HeroListName != Players In Slot(Slot Of(Event Player), Team 1)
				.p_HeroClassNames[Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroClass]);
				Event Player.p_BotHeroNumber = 0;
				Event Player.p_HeroNumberMod = 0;
				Call Subroutine(pSub_SetHeroClass);
				Call Subroutine(botSub_SetHero);
			Else;
				Call Subroutine(botSub_TeleportBot);
			End;
		Else;
			If(Players In Slot(Slot Of(Event Player), Team 2).ai_AIEnabled == True);
				Call Subroutine(botSub_ResetBot);
			End;
			Set Status(Players In Slot(Slot Of(Event Player), Team 1), Null, Phased Out, 9999);
			If(Players In Slot(Slot Of(Event Player), Team 1).p_ElevatorEnabled == True);
				Start Forcing Player Position(Players In Slot(Slot Of(Event Player), Team 1), Players In Slot(Slot Of(Event Player), Team 1)
					.p_HomeVector + Vector(0, Players In Slot(Slot Of(Event Player), Team 1).p_ElevatorHeight, 0), False);
			Else;
				Start Forcing Player Position(Players In Slot(Slot Of(Event Player), Team 1), Players In Slot(Slot Of(Event Player), Team 1)
					.p_HomeVector, False);
			End;
			Start Facing(Players In Slot(Slot Of(Event Player), Team 1), Facing Direction Of(Players In Slot(Slot Of(Event Player), Team 1)),
				100, To World, Direction and Turn Rate);
			Call Subroutine(allSub_ButtonsDisallow);
			Heal(Players In Slot(Slot Of(Event Player), Team 1), Null, Max Health(Players In Slot(Slot Of(Event Player), Team 1)));
			Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVisibleTo = Players In Slot(Slot Of(Event Player), Team 1);
			Call Subroutine(hudSub_SkyMenuArrowSet);
			Disable Hero HUD(Players In Slot(Slot Of(Event Player), Team 1));
			"Generate Menu"
			Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVectors = Empty Array;
			For Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_i, -1, 14, 1);
				Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_SkyMenuVectors, Append To Array, Vector(0, 45,
					1.250 * Players In Slot(Slot Of(Event Player), Team 1).hud_i));
			End;
			Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuSelection = Players In Slot(Slot Of(Event Player), Team 1)
				.hud_SkyMenuVectors[0];
			Stop Camera(Event Player);
			Start Camera(Players In Slot(Slot Of(Event Player), Team 1), Players In Slot(Slot Of(Event Player), Team 1)
				.hud_SkyMenuSelection - Vector(0, 15, 0.001), Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuSelection, 30);
			Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuIsOpen = True;
			Big Message(Players In Slot(Slot Of(Event Player), Team 1), Players In Slot(Slot Of(Event Player), Team 1)
				.p_Language == 1 ? Custom String("메뉴를 탐색하려면 WASD 버튼을 사용하십시오") : Custom String("Use WASD to navigate the menu"));
			Big Message(Players In Slot(Slot Of(Event Player), Team 1), Players In Slot(Slot Of(Event Player), Team 1)
				.p_Language == 1 ? Custom String("[{0} 및 {1}]를 길게 누르면 메뉴가 닫힙니다", Input Binding String(Button(Reload)), Input Binding String(
				Button(Melee))) : Custom String("Press and hold {0} and {1} to close the menu", Input Binding String(Button(Reload)),
				Input Binding String(Button(Melee))));
			"Menu Selection Arrows"
			Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuArrowsVisibleTo = Array(Null, Null);
			Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenu = Empty Array;
			Create In-World Text(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuArrowsVisibleTo[0], Icon String(Arrow: Left),
				Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuSelection + Vector(4.500, 0, 0), 1.250, Clip Against Surfaces,
				Visible To Position and String, Color(White), Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_SkyMenu, Append To Array, Last Text ID);
			Create In-World Text(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuArrowsVisibleTo[1], Icon String(Arrow: Right),
				Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuSelection + Vector(-4.500, 0, 0), 1.250, Clip Against Surfaces,
				Visible To Position and String, Color(White), Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_SkyMenu, Append To Array, Last Text ID);
			Create Beam Effect(Players In Slot(Slot Of(Event Player), Team 1), Bad Beam, Players In Slot(Slot Of(Event Player), Team 1)
				.hud_SkyMenuSelection + Vector(-4.500, 0, -0.500), Players In Slot(Slot Of(Event Player), Team 1)
				.hud_SkyMenuSelection + Vector(4.500, 0, -0.500), Event Player.p_EffectsColor, Position Radius and Color);
			Players In Slot(Slot Of(Event Player), Team 1).p_Effects[10] = Last Created Entity;
			Create Beam Effect(Players In Slot(Slot Of(Event Player), Team 1), Bad Beam, Players In Slot(Slot Of(Event Player), Team 1)
				.hud_SkyMenuSelection + Vector(-4.500, 0, -1.500), Players In Slot(Slot Of(Event Player), Team 1)
				.hud_SkyMenuSelection + Vector(4.500, 0, -1.500), Event Player.p_EffectsColor, Position Radius and Color);
			Players In Slot(Slot Of(Event Player), Team 1).p_Effects[11] = Last Created Entity;
			"Menu Text"
			Create In-World Text(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVisibleTo, Players In Slot(Slot Of(Event Player),
				Team 1).p_Language == 1 ? Custom String("난이도: {0}", Players In Slot(Slot Of(Event Player), Team 1)
				.p_DifficultyNames[Players In Slot(Slot Of(Event Player), Team 1).p_Difficulty]) : Custom String("Difficulty: {0}",
				Players In Slot(Slot Of(Event Player), Team 1).p_DifficultyNames[Players In Slot(Slot Of(Event Player), Team 1).p_Difficulty]),
				Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVectors[0], 1.500, Clip Against Surfaces, Visible To and String,
				Color(White), Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_SkyMenu, Append To Array, Last Text ID);
			Create In-World Text(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVisibleTo, Players In Slot(Slot Of(Event Player),
				Team 1).p_Language == 1 ? Custom String("필요한 킬 수: {0}", Players In Slot(Slot Of(Event Player), Team 1)
				.p_KillGoal == Global.pseudoInfinity ? Custom String("무한") : Players In Slot(Slot Of(Event Player), Team 1).p_KillGoal)
				: Custom String("Kill Goal: {0}", Players In Slot(Slot Of(Event Player), Team 1)
				.p_KillGoal == Global.pseudoInfinity ? Custom String("Infinite") : Players In Slot(Slot Of(Event Player), Team 1).p_KillGoal),
				Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVectors[1], 1.500, Clip Against Surfaces, Visible To and String,
				Color(White), Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_SkyMenu, Append To Array, Last Text ID);
			Create In-World Text(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVisibleTo, Players In Slot(Slot Of(Event Player),
				Team 1).p_Language == 1 ? Custom String("영웅 유형: {0}", Players In Slot(Slot Of(Event Player), Team 1)
				.p_HeroClassNames[Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroClass]) : Custom String("Hero Class: {0}",
				Players In Slot(Slot Of(Event Player), Team 1).p_HeroClassNames[Players In Slot(Slot Of(Event Player), Team 1)
				.p_BotHeroClass]), Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVectors[2], 1.500, Clip Against Surfaces,
				Visible To and String, Color(White), Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_SkyMenu, Append To Array, Last Text ID);
			Create In-World Text(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVisibleTo, Players In Slot(Slot Of(Event Player),
				Team 1).p_Language == 1 ? Custom String("빠른 모드: {0}", Players In Slot(Slot Of(Event Player), Team 1)
				.p_QuickModeEnabled == True ? Custom String("활성화") : Custom String("비활성화")) : Custom String("Quick Mode: {0}", Players In Slot(
				Slot Of(Event Player), Team 1).p_QuickModeEnabled == True ? Custom String("On") : Custom String("Off")), Players In Slot(
				Slot Of(Event Player), Team 1).hud_SkyMenuVectors[3], 1.500, Clip Against Surfaces, Visible To and String, Color(White),
				Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_SkyMenu, Append To Array, Last Text ID);
			Create In-World Text(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVisibleTo, Players In Slot(Slot Of(Event Player),
				Team 1).p_Language == 1 ? Custom String("같은 영웅 모드: {0}", Players In Slot(Slot Of(Event Player), Team 1)
				.p_MirrorModeEnabled == True ? Custom String("활성화") : Custom String("비활성화")) : Custom String("Mirror Mode: {0}",
				Players In Slot(Slot Of(Event Player), Team 1).p_MirrorModeEnabled == True ? Custom String("On") : Custom String("Off")),
				Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVectors[4], 1.500, Clip Against Surfaces, Visible To and String,
				Color(White), Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_SkyMenu, Append To Array, Last Text ID);
			Create In-World Text(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVisibleTo, Players In Slot(Slot Of(Event Player),
				Team 1).p_Language == 1 ? Custom String("1 초 쿨 다운 모드: {0}", Players In Slot(Slot Of(Event Player), Team 1)
				.p_OneSecCooldown == 3 ? Custom String("플레이어 + 인공 지능") : (Players In Slot(Slot Of(Event Player), Team 1)
				.p_OneSecCooldown == 2 ? Custom String("인공지는") : (Players In Slot(Slot Of(Event Player), Team 1)
				.p_OneSecCooldown == 1 ? Custom String("플레이어") : Custom String("비활성화")))) : Custom String("1 Sec Cooldown Mode: {0}",
				Players In Slot(Slot Of(Event Player), Team 1).p_OneSecCooldown == 3 ? Custom String("Player & Bot") : (Players In Slot(
				Slot Of(Event Player), Team 1).p_OneSecCooldown == 2 ? Custom String("Bot") : (Players In Slot(Slot Of(Event Player), Team 1)
				.p_OneSecCooldown == 1 ? Custom String("Player") : Custom String("Off")))), Players In Slot(Slot Of(Event Player), Team 1)
				.hud_SkyMenuVectors[5], 1.500, Clip Against Surfaces, Visible To and String, Color(White), Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_SkyMenu, Append To Array, Last Text ID);
			Create In-World Text(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVisibleTo, Players In Slot(Slot Of(Event Player),
				Team 1).p_Language == 1 ? Custom String("킬 점수 패널티: {0}", Players In Slot(Slot Of(Event Player), Team 1)
				.p_MinusKillOnDeath == True ? Custom String("활성화") : Custom String("비활성화")) : Custom String("-1 Kill On Death: {0}",
				Players In Slot(Slot Of(Event Player), Team 1).p_MinusKillOnDeath == True ? Custom String("On") : Custom String("Off")),
				Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVectors[6], 1.500, Clip Against Surfaces, Visible To and String,
				Color(White), Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_SkyMenu, Append To Array, Last Text ID);
			Create In-World Text(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVisibleTo, Players In Slot(Slot Of(Event Player),
				Team 1).p_Language == 1 ? Custom String("플레이어 치유: {0}", Players In Slot(Slot Of(Event Player), Team 1)
				.all_HealingEnabled == True ? Custom String("활성화") : Custom String("비활성화")) : Custom String("Player Healing: {0}",
				Players In Slot(Slot Of(Event Player), Team 1).all_HealingEnabled == True ? Custom String("On") : Custom String("Off")),
				Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVectors[7], 1.500, Clip Against Surfaces, Visible To and String,
				Color(White), Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_SkyMenu, Append To Array, Last Text ID);
			Create In-World Text(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVisibleTo, Players In Slot(Slot Of(Event Player),
				Team 1).p_Language == 1 ? Custom String("인공지는 치유: {0}", Players In Slot(Slot Of(Event Player), Team 2)
				.all_HealingEnabled == True ? Custom String("활성화") : Custom String("비활성화")) : Custom String("Bot Healing: {0}",
				Players In Slot(Slot Of(Event Player), Team 2).all_HealingEnabled == True ? Custom String("On") : Custom String("Off")),
				Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVectors[8], 1.500, Clip Against Surfaces, Visible To and String,
				Color(White), Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_SkyMenu, Append To Array, Last Text ID);
			Create In-World Text(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVisibleTo, Players In Slot(Slot Of(Event Player),
				Team 1).p_Language == 1 ? Custom String("플레이어는 죽일 수 없다: {0}", Players In Slot(Slot Of(Event Player), Team 1)
				.p_Unkillable == True ? Custom String("활성화") : Custom String("비활성화")) : Custom String("Player Unkillable: {0}",
				Players In Slot(Slot Of(Event Player), Team 1).p_Unkillable == True ? Custom String("On") : Custom String("Off")),
				Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVectors[9], 1.500, Clip Against Surfaces, Visible To and String,
				Color(White), Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_SkyMenu, Append To Array, Last Text ID);
			Create In-World Text(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVisibleTo, Players In Slot(Slot Of(Event Player),
				Team 1).p_Language == 1 ? Custom String("인공지는 궁극적 인 장애인: {0}", Players In Slot(Slot Of(Event Player), Team 2)
				.ai_UltimateDisabled == True ? Custom String("활성화") : Custom String("비활성화")) : Custom String("Disable Bot Ultimate: {0}",
				Players In Slot(Slot Of(Event Player), Team 2).ai_UltimateDisabled == True ? Custom String("On") : Custom String("Off")),
				Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVectors[10], 1.500, Clip Against Surfaces, Visible To and String,
				Color(White), Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_SkyMenu, Append To Array, Last Text ID);
			Create In-World Text(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVisibleTo, Players In Slot(Slot Of(Event Player),
				Team 1).p_Language == 1 ? Custom String("인공지는 깜박거리는: {0}", Players In Slot(Slot Of(Event Player), Team 2)
				.bot_FlickerEnabled == True ? Custom String("활성화") : Custom String("비활성화")) : Custom String("Bot Flicker: {0}",
				Players In Slot(Slot Of(Event Player), Team 2).bot_FlickerEnabled == True ? Custom String("On") : Custom String("Off")),
				Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVectors[11], 1.500, Clip Against Surfaces, Visible To and String,
				Color(White), Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_SkyMenu, Append To Array, Last Text ID);
			Create In-World Text(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVisibleTo, Players In Slot(Slot Of(Event Player),
				Team 1).p_Language == 1 ? Custom String("플레이어 엘리베이터: {0}", Players In Slot(Slot Of(Event Player), Team 1)
				.p_ElevatorEnabled == True ? Custom String("활성화") : Custom String("비활성화")) : Custom String("Player Elevator: {0}",
				Players In Slot(Slot Of(Event Player), Team 1).p_ElevatorEnabled == True ? Custom String("On") : Custom String("Off")),
				Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVectors[12], 1.500, Clip Against Surfaces, Visible To and String,
				Color(White), Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_SkyMenu, Append To Array, Last Text ID);
			Create In-World Text(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVisibleTo, Players In Slot(Slot Of(Event Player),
				Team 1).p_Language == 1 ? Custom String("색깔: {0}", Players In Slot(Slot Of(Event Player), Team 1).p_EffectsColor)
				: Custom String("Bubble & Effect Color: {0}", Players In Slot(Slot Of(Event Player), Team 1).p_EffectsColor), Players In Slot(
				Slot Of(Event Player), Team 1).hud_SkyMenuVectors[13], 1.500, Clip Against Surfaces, Visible To and String, Color(White),
				Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_SkyMenu, Append To Array, Last Text ID);
			Create In-World Text(Players In Slot(Slot Of(Event Player), Team 1).hud_SkyMenuVisibleTo, Players In Slot(Slot Of(Event Player),
				Team 1).p_Language == 1 ? Custom String("언어: {0}", Players In Slot(Slot Of(Event Player), Team 1)
				.p_Language == 1 ? Custom String("한국어") : Custom String("English")) : Custom String("Language: {0}", Players In Slot(Slot Of(
				Event Player), Team 1).p_Language == 1 ? Custom String("한국어") : Custom String("English")), Players In Slot(Slot Of(
				Event Player), Team 1).hud_SkyMenuVectors[14], 1.500, Clip Against Surfaces, Visible To and String, Color(White),
				Default Visibility);
			Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_SkyMenu, Append To Array, Last Text ID);
			Call Subroutine(hudSub_SkyMenuArrowSet);
		End;
		Play Effect(Players In Slot(Slot Of(Event Player), Team 1), Buff Explosion Sound, Color(White), Players In Slot(Slot Of(
			Event Player), Team 1).hud_SkyMenuSelection - Vector(0, 15, 0), 75);
	}
}