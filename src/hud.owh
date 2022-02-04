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
         Players In Slot(Slot Of(Event Player), Team 1).hud_Debug = Array();
         Players In Slot(Slot Of(Event Player), Team 1).hud_DebugEnabled = True;
         Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Custom String("Server Load: {0}% ({1})", Round To Integer(
            Server Load / 2.550, Down), Server Load), Custom String("Average: {0}% ({1})", Round To Integer(Server Load Average / 2.550,
            Down), Server Load Average), Custom String("Peak: {0}% ({1})", Round To Integer(Server Load Peak / 2.550, Down),
            Server Load Peak), Top, 100, Global.c_Color_LightPink, Global.c_Color_LightTeal, Global.c_Color_DarkTeal, Visible To and String,
            Default Visibility);
         Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_Debug, Append To Array, Last Text ID);
         Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Null, Custom String("Enemy Pos: {0}", Position Of(Players In Slot(
            Slot Of(Event Player), Team 2))), Custom String("Player Pos: {0}", Position Of(Event Player)), Left, 4, Color(White),
            Global.c_Color_LightPink, Global.c_Color_LightTeal, Visible To and String, Default Visibility);
         Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_Debug, Append To Array, Last Text ID);
         Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Null, Custom String("Enemy Dist From Home: {0}", Distance Between(
            Players In Slot(Slot Of(Event Player), Team 2), Players In Slot(Slot Of(Event Player), Team 1).p_HomeVector)), Custom String(
            "Player Dist From Home: {0}", Distance Between(Players In Slot(Slot Of(Event Player), Team 1), Players In Slot(Slot Of(
            Event Player), Team 1).p_HomeVector)), Left, 5, Color(White), Global.c_Color_LightPink, Global.c_Color_LightTeal,
            Visible To and String, Default Visibility);
         Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_Debug, Append To Array, Last Text ID);
         Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Custom String("Enemy Distance From Player: {0}", Distance Between(
            Players In Slot(Slot Of(Event Player), Team 1), Players In Slot(Slot Of(Event Player), Team 2))), Null, Null, Left, 5.200,
            Global.c_Color_LightPink, Color(White), Color(White), Visible To and String, Default Visibility);
         Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_Debug, Append To Array, Last Text ID);
         Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Custom String("Enemy Ult Charge: {0}", Ultimate Charge Percent(
            Players In Slot(Slot Of(Event Player), Team 2))), Null, Null, Right, 6, Global.c_Color_LightGrey, Color(White), Color(White),
            Visible To and String, Default Visibility);
         Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_Debug, Append To Array, Last Text ID);
         Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Custom String("Player Facing Dir: {0}", Facing Direction Of(
            Event Player)), Null, Custom String("Enemy Facing Dir: {0}", Facing Direction Of(Players In Slot(Slot Of(Event Player),
            Team 2))), Left, 6.100, Global.c_Color_LightTeal, Color(White), Global.c_Color_LightPink, Visible To and String, Default Visibility);
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
         
         // Auto-close after 20 seconds open
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
         Players In Slot(Slot Of(Event Player), Team 1).hud_Main = Array();
         
         // Create Right Side HUD Text
         Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Players In Slot(Slot Of(Event Player), Team 1)
            .p_Language == 1 ? Custom String("{0} 킬: {1} / {2}", Hero Icon String(Players In Slot(Slot Of(Event Player), Team 1)
            .p_HeroList[Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumber]), Players In Slot(Slot Of(Event Player), Team 1)
            .all_Kills, Players In Slot(Slot Of(Event Player), Team 1).p_KillGoal == Global.c_PseudoInfinity ? Custom String("무한")
            : Players In Slot(Slot Of(Event Player), Team 1).p_KillGoal) : Custom String("{0} Kills: {1} / {2}", Hero Icon String(
            Players In Slot(Slot Of(Event Player), Team 1).p_HeroList[Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumber]),
            Players In Slot(Slot Of(Event Player), Team 1).all_Kills, Players In Slot(Slot Of(Event Player), Team 1)
            .p_KillGoal == Global.c_PseudoInfinity ? Custom String("Infinite") : Players In Slot(Slot Of(Event Player), Team 1).p_KillGoal),
            Null, Null, Right, -3, Color(White), Color(White), Color(White), Visible To and String, Default Visibility);
         Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_Main, Append To Array, Last Text ID);
         Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Null, Players In Slot(Slot Of(Event Player), Team 1)
            .p_Language == 1 ? Custom String("{0} 당신을 {1} 번 죽였습니다", Hero Of(Players In Slot(Slot Of(Event Player), Team 2)),
            Players In Slot(Slot Of(Event Player), Team 2).all_Kills) : Custom String("{0} killed you {1} time(s).", Hero Of(
            Players In Slot(Slot Of(Event Player), Team 2)), Players In Slot(Slot Of(Event Player), Team 2).all_Kills), Null, Right,
            -2.900, Color(White), Global.c_Color_LightPink, Color(Red), Visible To and String, Default Visibility);
         Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_Main, Append To Array, Last Text ID);
         Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Null, Players In Slot(Slot Of(Event Player), Team 1)
            .p_Language == 1 ? Custom String("영웅 유형: {0}", Players In Slot(Slot Of(Event Player), Team 1).p_HeroListName) : Custom String(
            "Hero Type: {0}", Players In Slot(Slot Of(Event Player), Team 1).p_HeroListName), Players In Slot(Slot Of(Event Player),
            Team 1).p_Language == 1 ? Custom String("영웅: {0} / {1}", 1 + Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumber,
            Count Of(Players In Slot(Slot Of(Event Player), Team 1).p_HeroList)) : Custom String("Hero: {0} / {1}", 1 + Players In Slot(
            Slot Of(Event Player), Team 1).p_BotHeroNumber, Count Of(Players In Slot(Slot Of(Event Player), Team 1).p_HeroList)), Right,
            -2.200, Color(White), Color(White), Global.c_Color_LightTeal, Visible To and String, Default Visibility);
         Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_Main, Append To Array, Last Text ID);
         Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Null, Players In Slot(Slot Of(Event Player), Team 1)
            .p_Language == 1 ? Custom String("다음 영웅: {0}", Players In Slot(Slot Of(Event Player), Team 1)
            .p_QuickModeEnabled == True ? Custom String("?") : Hero Icon String(Players In Slot(Slot Of(Event Player), Team 1)
            .p_HeroList[Players In Slot(Slot Of(Event Player), Team 1).p_BotHeroNumberNext])) : Custom String("Next Hero: {0}",
            Players In Slot(Slot Of(Event Player), Team 1).p_QuickModeEnabled == True ? Custom String("?") : Hero Icon String(
            Players In Slot(Slot Of(Event Player), Team 1).p_HeroList[Players In Slot(Slot Of(Event Player), Team 1)
            .p_BotHeroNumberNext])), Null, Right, -2, Color(White), Global.c_Color_DarkTeal, Color(Aqua), Visible To and String,
            Default Visibility);
         Modify Player Variable(Players In Slot(Slot Of(Event Player), Team 1), hud_Main, Append To Array, Last Text ID);
         Create HUD Text(Players In Slot(Slot Of(Event Player), Team 1), Null, Players In Slot(Slot Of(Event Player), Team 1)
            .p_Language == 1 ? Custom String("난이도: {0}", Players In Slot(Slot Of(Event Player), Team 1).p_DifficultyNames[Players In Slot(
            Slot Of(Event Player), Team 1).p_Difficulty]) : Custom String("Difficulty: {0}", Players In Slot(Slot Of(Event Player), Team 1)
            .p_DifficultyNames[Players In Slot(Slot Of(Event Player), Team 1).p_Difficulty]), Null, Right, -0.900, Color(White),
            Global.c_Color_LightGrey, Color(White), Visible To and String, Default Visibility);
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
      // On, Off, Neutral, Other
      If(Event Player.hud_SkyMenuSound == 0);
         Play Effect(Event Player, Buff Impact Sound, Color(White), Players In Slot(Slot Of(Event Player),
            Team 1).hud_SkyMenuSelection - Vector(0, 15, 0), 20);
      Else If(Event Player.hud_SkyMenuSound == 1);
         Play Effect(Event Player, Debuff Impact Sound, Color(White), Players In Slot(Slot Of(
            Event Player), Team 1).hud_SkyMenuSelection - Vector(0, 15, 0), 20);
      Else If(Event Player.hud_SkyMenuSound == 2);
         Play Effect(Event Player, Explosion Sound, Color(White), Players In Slot(Slot Of(Event Player),
            Team 1).hud_SkyMenuSelection - Vector(0, 15, 0), 15);
      Else;
         Play Effect(Event Player, Explosion Sound, Color(White), Players In Slot(Slot Of(Event Player),
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
      // Close other HUD elements if they're open because Effects budget
      If(Event Player.hud_InfoEnabled == True);
         Call Subroutine(hudSub_InfoToggle);
      End;
      If(Count Of(Event Player.hud_Debug) > 0);
         Call Subroutine(hudSub_DebugToggle);
      End;
      If(Count Of(Event Player.hud_Main) > 0);
         Call Subroutine(hudSub_MainToggle);
      End;

      Wait(3 / 60, Ignore Condition);

      // Exit the menu
      If(Count Of(Event Player.hud_SkyMenu) > 0);
         For Player Variable(Event Player, hud_i, Count Of(Event Player
            .hud_SkyMenu), -1, -1);
            Destroy In-World Text(Event Player.hud_SkyMenu[Event Player
               .hud_i]);
            Event Player.hud_SkyMenu = Remove From Array(Event Player
               .hud_SkyMenu, Event Player.hud_SkyMenu[Event Player
               .hud_i]);
         End;
         Destroy Effect(Event Player.p_Effects[10]);
         Destroy Effect(Event Player.p_Effects[11]);

         // Don't clear the Phased Out status if player set the Invulnerable setting to that
         If(Event Player.p_Invulnerable != 2);
            Clear Status(Event Player, Phased Out);
         End;

         Stop Forcing Player Position(Event Player);
         Stop Facing(Event Player);
         Call Subroutine(allSub_ButtonsAllow);
         Wait(6 / 60, Ignore Condition);
         Event Player.hud_SkyMenuIsOpen = False;
         Event Player.hud_SkyMenuVisibleTo = Null;
         Event Player.hud_SkyMenuArrowsVisibleTo[0] = Null;
         Event Player.hud_SkyMenuArrowsVisibleTo[1] = Null;
         Stop Camera(Event Player);
         Enable Hero HUD(Event Player);
         Call Subroutine(hudSub_MainToggle);

         If(Event Player.p_PresetName != Global.c_PresetNames[Event Player.p_Preset]);
            Event Player.p_PresetName = Global.c_PresetNames[Event Player.p_Preset];
            Call Subroutine(pSub_SetPreset);
         End;

         If(Event Player.p_HeroListName != Event Player
            .p_HeroRoleNames[Event Player.p_BotHeroRole]);
            Event Player.p_BotHeroNumber = 0;
            Event Player.p_HeroNumberMod = 0;
            Call Subroutine(pSub_SetHeroRole);
            Call Subroutine(botSub_SetHero);
         Else;
            Call Subroutine(botSub_TeleportBot);
         End;

      // Open the menu
      Else;
         If(Players In Slot(Slot Of(Event Player), Team 2).ai_AIEnabled == True);
            Call Subroutine(botSub_ResetBot);
         End;
         Set Status(Event Player, Null, Phased Out, Global.c_PseudoInfinity);
         If(Event Player.p_ElevatorEnabled == True);
            Start Forcing Player Position(Event Player, Event Player
               .p_HomeVector + Vector(0, Event Player.p_ElevatorHeight, 0), False);
         Else;
            Start Forcing Player Position(Event Player, Event Player
               .p_HomeVector, False);
         End;
         Start Facing(Event Player, Facing Direction Of(Event Player),
            100, To World, Direction and Turn Rate);
         Call Subroutine(allSub_ButtonsDisallow);

         // Clear statuses and heal
         Clear Status(Event Player, Burning);
         Clear Status(Event Player, Knocked Down);
         Clear Status(Event Player, Asleep);
         Clear Status(Event Player, Frozen);
         Clear Status(Event Player, Stunned);
         Clear Status(Event Player, Rooted);
         Heal(Event Player, Null, Max Health(Event Player));

         Event Player.hud_SkyMenuVisibleTo = Event Player;
         Call Subroutine(hudSub_SkyMenuArrowSet);
         Disable Hero HUD(Event Player);

         // Generate Menu
         Event Player.hud_SkyMenuVectors = Array();
         For Player Variable(Event Player, hud_i, -1, 15, 1);
            Modify Player Variable(Event Player, hud_SkyMenuVectors, Append To Array, Vector(0, 45,
               1.250 * Event Player.hud_i));
         End;
         Event Player.hud_SkyMenuSelection = Event Player
            .hud_SkyMenuVectors[0];
         
         // Menu Selection Arrows
         Event Player.hud_SkyMenuArrowsVisibleTo = Array(Null, Null);
         Event Player.hud_SkyMenu = Array();
         Create In-World Text(Event Player.hud_SkyMenuArrowsVisibleTo[0], Icon String(Arrow: Left),
            Event Player.hud_SkyMenuSelection + Vector(4.500, 0, 0), 1.250, Clip Against Surfaces,
            Visible To Position and String, Color(White), Default Visibility);
         Modify Player Variable(Event Player, hud_SkyMenu, Append To Array, Last Text ID);
         Create In-World Text(Event Player.hud_SkyMenuArrowsVisibleTo[1], Icon String(Arrow: Right),
            Event Player.hud_SkyMenuSelection + Vector(-4.500, 0, 0), 1.250, Clip Against Surfaces,
            Visible To Position and String, Color(White), Default Visibility);
         Modify Player Variable(Event Player, hud_SkyMenu, Append To Array, Last Text ID);

         // Selection Beams
         Create Beam Effect(Event Player, Bad Beam, Event Player
            .hud_SkyMenuSelection + Vector(-4.500, 0, -0.500), Event Player
            .hud_SkyMenuSelection + Vector(4.500, 0, -0.500), Event Player.p_EffectsColor, Position Radius and Color);
         Event Player.p_Effects[10] = Last Created Entity;
         Create Beam Effect(Event Player, Bad Beam, Event Player
            .hud_SkyMenuSelection + Vector(-4.500, 0, -1.500), Event Player
            .hud_SkyMenuSelection + Vector(4.500, 0, -1.500), Event Player.p_EffectsColor, Position Radius and Color);
         Event Player.p_Effects[11] = Last Created Entity;

         // Menu Text
         Create In-World Text(Event Player.hud_SkyMenuVisibleTo, Event Player.p_Language == 1 ? Custom String("난이도: {0}", Event Player
            .p_DifficultyNames[Event Player.p_Difficulty]) : Custom String("Difficulty: {0}",
            Event Player.p_DifficultyNames[Event Player.p_Difficulty]),
            Event Player.hud_SkyMenuVectors[0], 1.500, Clip Against Surfaces, Visible To String and Color,
            Global.c_DifficultyColors[Event Player.p_Difficulty], Default Visibility);
         Modify Player Variable(Event Player, hud_SkyMenu, Append To Array, Last Text ID);

         Create In-World Text(Event Player.hud_SkyMenuVisibleTo, Event Player.p_Language == 1 ? Custom String("필요한 킬 수: {0}", Event Player
            .p_KillGoal == Global.c_PseudoInfinity ? Custom String("무한") : Event Player.p_KillGoal)
            : Custom String("Kill Goal: {0}", Event Player
            .p_KillGoal == Global.c_PseudoInfinity ? Custom String("Infinite") : Event Player.p_KillGoal),
            Event Player.hud_SkyMenuVectors[1], 1.500, Clip Against Surfaces, Visible To and String,
            Color(White), Default Visibility);
         Modify Player Variable(Event Player, hud_SkyMenu, Append To Array, Last Text ID);

         Create In-World Text(Event Player.hud_SkyMenuVisibleTo, Custom String("Preset: {0}", Global.c_PresetNames[Event Player.p_Preset]),
            Event Player.hud_SkyMenuVectors[2], 1.250, Clip Against Surfaces, Visible To and String,
            Color(White), Default Visibility);
         Modify Player Variable(Event Player, hud_SkyMenu, Append To Array, Last Text ID);

         Create In-World Text(Event Player.hud_SkyMenuVisibleTo, Event Player.p_Language == 1 ? Custom String("영웅 유형: {0}", Event Player
            .p_HeroRoleNames[Event Player.p_BotHeroRole]) : Custom String("Bot Hero Role: {0}",
            Event Player.p_HeroRoleNames[Event Player
            .p_BotHeroRole]), Event Player.hud_SkyMenuVectors[3], 1.500, Clip Against Surfaces,
            Visible To and String, Color(White), Default Visibility);
         Modify Player Variable(Event Player, hud_SkyMenu, Append To Array, Last Text ID);

         Create In-World Text(Event Player.hud_SkyMenuVisibleTo, Event Player.p_Language == 1 ? Custom String("빠른 모드: {0}", Event Player
            .p_QuickModeEnabled == True ? Custom String("활성화") : Custom String("비활성화")) : Custom String("Quick Mode: {0}", Players In Slot(
            Slot Of(Event Player), Team 1).p_QuickModeEnabled == True ? Custom String("On") : Custom String("Off")), Players In Slot(
            Slot Of(Event Player), Team 1).hud_SkyMenuVectors[4], 1.500, Clip Against Surfaces, Visible To and String, Color(White),
            Default Visibility);
         Modify Player Variable(Event Player, hud_SkyMenu, Append To Array, Last Text ID);

         Create In-World Text(Event Player.hud_SkyMenuVisibleTo, Event Player.p_Language == 1 ? Custom String("같은 영웅 모드: {0}", Event Player
            .p_MirrorModeEnabled == True ? Custom String("활성화") : Custom String("비활성화")) : Custom String("Mirror Mode: {0}",
            Event Player.p_MirrorModeEnabled == True ? Custom String("On") : Custom String("Off")),
            Event Player.hud_SkyMenuVectors[5], 1.500, Clip Against Surfaces, Visible To and String,
            Color(White), Default Visibility);
         Modify Player Variable(Event Player, hud_SkyMenu, Append To Array, Last Text ID);

         Create In-World Text(Event Player.hud_SkyMenuVisibleTo, Event Player.p_Language == 1 ? Custom String("1 초 쿨 다운 모드: {0}", Event Player
            .p_OneSecCooldown == 3 ? Custom String("플레이어 + 인공 지능") : (Event Player
            .p_OneSecCooldown == 2 ? Custom String("인공지는") : (Event Player
            .p_OneSecCooldown == 1 ? Custom String("플레이어") : Custom String("비활성화")))) : Custom String("1 Sec Cooldown Mode: {0}",
            Event Player.p_OneSecCooldown == 3 ? Custom String("Player & Bot") : (Players In Slot(
            Slot Of(Event Player), Team 1).p_OneSecCooldown == 2 ? Custom String("Bot") : (Event Player
            .p_OneSecCooldown == 1 ? Custom String("Player") : Custom String("Off")))), Event Player
            .hud_SkyMenuVectors[6], 1.250, Clip Against Surfaces, Visible To and String, Color(White), Default Visibility);
         Modify Player Variable(Event Player, hud_SkyMenu, Append To Array, Last Text ID);
         
         Create In-World Text(Event Player.hud_SkyMenuVisibleTo, Event Player.p_Language == 1 ? Custom String("킬 점수 패널티: {0}", Event Player
            .p_KillsLostOnDeath) : Custom String("Points Lost On Death: {0}",
            Event Player.p_KillsLostOnDeath == Global.c_PseudoInfinity ? Custom String("All") : 
            Event Player.p_KillsLostOnDeath),
            Event Player.hud_SkyMenuVectors[7], 1.500, Clip Against Surfaces, Visible To and String,
            Color(White), Default Visibility);
         Modify Player Variable(Event Player, hud_SkyMenu, Append To Array, Last Text ID);

         Create In-World Text(Event Player.hud_SkyMenuVisibleTo, Event Player.p_Language == 1 ? Custom String("플레이어 치유: {0}", Event Player
            .p_HealingEnabled == True ? Custom String("활성화") : Custom String("비활성화")) : Custom String("Player Healing: {0}",
            Event Player.p_HealingEnabled == True ? Custom String("On") : Custom String("Off")),
            Event Player.hud_SkyMenuVectors[8], 1.500, Clip Against Surfaces, Visible To and String,
            Color(White), Default Visibility);
         Modify Player Variable(Event Player, hud_SkyMenu, Append To Array, Last Text ID);

         Create In-World Text(Event Player.hud_SkyMenuVisibleTo, Event Player.p_Language == 1 ? Custom String("인공지는 치유: {0}", Event Player
            .p_BotHealingEnabled == True ? Custom String("활성화") : Custom String("비활성화")) : Custom String("Bot Healing: {0}",
            Event Player.p_BotHealingEnabled == True ? Custom String("On") : Custom String("Off")),
            Event Player.hud_SkyMenuVectors[9], 1.500, Clip Against Surfaces, Visible To and String,
            Color(White), Default Visibility);
         Modify Player Variable(Event Player, hud_SkyMenu, Append To Array, Last Text ID);

         Create In-World Text(Event Player.hud_SkyMenuVisibleTo, Event Player.p_Language == 1 ? Custom String("플레이어는 죽일 수 없다: {0}", Event Player
            .p_Invulnerable == True ? Custom String("활성화") : Custom String("비활성화")) : Custom String("Player Unkillable: {0}",
            Event Player.p_Invulnerable == 3 ? Custom String("On (Invincible)")
            : Event Player.p_Invulnerable == 2 ? Custom String("On (Phased Out)")
            : Event Player.p_Invulnerable == 1 ? Custom String("On (Unkillable)") : Custom String("Off")),
            Event Player.hud_SkyMenuVectors[10], 1.500, Clip Against Surfaces, Visible To and String,
            Color(White), Default Visibility);
         Modify Player Variable(Event Player, hud_SkyMenu, Append To Array, Last Text ID);

         Create In-World Text(Event Player.hud_SkyMenuVisibleTo, Event Player.p_Language == 1 ? Custom String("인공지는 궁극적 인 장애인: {0}", Event Player
            .p_BotUltimateDisabled == True ? Custom String("활성화") : Custom String("비활성화")) : Custom String("Disable Bot Ultimate: {0}",
            Event Player.p_BotUltimateDisabled == True ? Custom String("On") : Custom String("Off")),
            Event Player.hud_SkyMenuVectors[11], 1.500, Clip Against Surfaces, Visible To and String,
            Color(White), Default Visibility);
         Modify Player Variable(Event Player, hud_SkyMenu, Append To Array, Last Text ID);

         Create In-World Text(Event Player.hud_SkyMenuVisibleTo, Event Player.p_Language == 1 ? Custom String("인공지는 깜박거리는: {0}", Event Player
            .p_BotFlickerEnabled == True ? Custom String("활성화") : Custom String("비활성화")) : Custom String("Bot Flicker: {0}",
            Event Player.p_BotFlickerEnabled == True ? Custom String("On") : Custom String("Off")),
            Event Player.hud_SkyMenuVectors[12], 1.500, Clip Against Surfaces, Visible To and String,
            Color(White), Default Visibility);
         Modify Player Variable(Event Player, hud_SkyMenu, Append To Array, Last Text ID);

         Create In-World Text(Event Player.hud_SkyMenuVisibleTo, Event Player.p_Language == 1 ? Custom String("플레이어 엘리베이터: {0}", Event Player
            .p_ElevatorEnabled == True ? Custom String("활성화") : Custom String("비활성화")) : Custom String("Player Elevator: {0}",
            Event Player.p_ElevatorEnabled == True ? Custom String("On") : Custom String("Off")),
            Event Player.hud_SkyMenuVectors[13], 1.500, Clip Against Surfaces, Visible To and String,
            Color(White), Default Visibility);
         Modify Player Variable(Event Player, hud_SkyMenu, Append To Array, Last Text ID);

         Create In-World Text(Event Player.hud_SkyMenuVisibleTo, Event Player.p_Language == 1 ? Custom String("색깔: {0}", Event Player.p_EffectsColor)
            : Custom String("Bubble & Effect Color: {0}", Event Player.p_EffectsColor), Players In Slot(
            Slot Of(Event Player), Team 1).hud_SkyMenuVectors[14], 1.500, Clip Against Surfaces, Visible To and String, Color(White),
            Default Visibility);
         Modify Player Variable(Event Player, hud_SkyMenu, Append To Array, Last Text ID);

         Create In-World Text(Event Player.hud_SkyMenuVisibleTo, Event Player.p_Language == 1 ? Custom String("언어: {0}", Event Player
            .p_Language == 1 ? Custom String("한국어") : Custom String("English")) : Custom String("Language: {0}", Players In Slot(Slot Of(
            Event Player), Team 1).p_Language == 1 ? Custom String("한국어") : Custom String("English")), Players In Slot(Slot Of(
            Event Player), Team 1).hud_SkyMenuVectors[15], 1.500, Clip Against Surfaces, Visible To and String, Color(White),
            Default Visibility);
         Modify Player Variable(Event Player, hud_SkyMenu, Append To Array, Last Text ID);
         
         Call Subroutine(hudSub_SkyMenuArrowSet);
         Stop Camera(Event Player);
         Call Subroutine(allSub_WaitForFrame);
         Start Camera(Event Player, Event Player
            .hud_SkyMenuSelection - Vector(0, 15, 0.001), Event Player.hud_SkyMenuSelection, 30);
         Event Player.hud_SkyMenuIsOpen = True;
         Big Message(Event Player, Event Player
            .p_Language == 1 ? Custom String("메뉴를 탐색하려면 WASD 버튼을 사용하십시오") : Custom String("Use WASD to navigate the menu"));
         Big Message(Event Player, Event Player
            .p_Language == 1 ? Custom String("[{0} 및 {1}]를 길게 누르면 메뉴가 닫힙니다", Input Binding String(Button(Reload)), Input Binding String(
            Button(Melee))) : Custom String("Press {0} and {1} to close the menu", Input Binding String(Button(Reload)),
            Input Binding String(Button(Melee))));
      End;

      Play Effect(Event Player, Buff Explosion Sound, Color(White), Players In Slot(Slot Of(
         Event Player), Team 1).hud_SkyMenuSelection - Vector(0, 15, 0), 75);
   }
}

