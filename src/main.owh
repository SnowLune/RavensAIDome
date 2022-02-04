settings
{
   main
   {
      Description: "Practice Field: Expanse is a tool for practicing against dummy bots with AI for all Heroes. (한국어 옵션 포함!)\n♥  This is a Pre-Release Beta Version!\n♥  Import Code: 5DPKQ\n♥  Created by Raven#112503\n♥  If you modify this mode and share your modification, please prepend \"Modified by: [your battletag]\"to this description."
      Mode Name: "Practice Field: Expanse"
   }

   lobby
   {
      Allow Players Who Are In Queue: Yes
      Max Spectators: 4
      Max Team 2 Players: 0
      Return To Lobby: Never
   }

   modes
   {
      Skirmish
      {
         enabled maps
         {
            Workshop Expanse
         }
      }

      General
      {
         Game Mode Start: Immediately
         Hero Limit: Off
         Respawn Time Scalar: 0%
         Spawn Health Packs: Disabled
      }
   }

   heroes
   {
      Team 1
      {
         Mercy
         {
            Weapons Enabled: Caduceus Blaster Only
         }
      }

      General
      {
         Ultimate Generation: 250%

         Wrecking Ball
         {
            Jump Vertical Speed: 300%
         }
      }
   }
}

variables
{
   global:

      //
      // global const
      //
      0:   c_BotNamesConst
      1:   c_BubbleRadius
      2:   c_BuildDate
      3:   c_Color_DarkPink
      4:   c_Color_DarkTeal
      5:   c_Color_EffectColors
      6:   c_Color_LightGrey
      7:   c_Color_LightPink
      8:   c_Color_LightTeal
      9:   c_DeveloperName
      10:   c_DiscordLink
      11:   c_GithubURL
      12:   c_HeroRoles
      13:   c_LargeZoneHeroes
      14:   c_LongDistance
      15:   c_LongRangeHeroes
      16:   c_MaxDifficulty
      17:   c_MediumDistance
      18:   c_MediumRangeHeroes
      19:   c_MoveDir_All
      20:   c_MoveDir_Backward
      21:   c_MoveDir_Forward
      22:   c_MoveDir_Strafe
      23:   c_ProjectileHeroes
      24:   c_PseudoInfinity
      25:   c_ScopeHeroes
      26:   c_ShortDistance
      27:   c_ShortRangeHeroes
      28:   c_TwitchURL
      29:   c_Version
      30:   c_VeryShortDistance
      31:   c_VeryShortRangeHeroes
      32:   c_WorkshopCode
      33:   c_ZoneRadiusDefault
      54: c_PresetNames
      55: c_DifficultyColors

      //
      // global variable
      //
      34:   g_BotHealing
      35:   g_BotNames
      36:   g_DebugHero
      37:   g_DebugHUD
      38:   g_DebugMode
      39:   g_Difficulty
      40:   g_BotHeroRole
      41:   g_Initialized
      42:   g_KillGoal
      43:   g_Language
      44:   g_OneSecCooldown
      45:   g_PlayerHealing
      46:   g_PlayerNames
      48:   g_Tick
      49:   g_UseBotNames

      //
      // global HUD variable (arrays used for language, may be deprecated soon)
      //
      50:   hud_InfoVisibleToEN
      51:   hud_InfoVisibleToKR
      52:   hud_MainVisibleToEN
      53:   hud_MainVisibleToKR

   player:

      //
      // AI variables
      //
      0:   ai_AbilityButton
      1:   ai_AbilityOpt
      2:   ai_AIEnabled
      3:   ai_AimBase
      4:   ai_AimBaseDefault
      5:   ai_AimModX
      6:   ai_AimModY
      7:   ai_AimStopTime
      8:   ai_AimTurnRate
      9:   ai_AimType
      10:  ai_AimTypeDefault
      11:  ai_BMVoiceLine
      12:  ai_CnAim
      13:  ai_CnAttack
      14:  ai_CnUseAbilities
      15:  ai_ChanceMod
      16:  ai_DoomfistPunchDamage
      17:  ai_DoomfistPunchTime
      18:  ai_FacingAngleMod
      19:  ai_FacingAnglePow
      20:  ai_FacingCapMax
      21:  ai_FacingCapMin
      22:  ai_FacingPadMax
      23:  ai_FacingPadMin
      24:  ai_FacingRelPosMod
      25:  ai_HeroInitialized
      26:  ai_IsInAbilitySub
      27:  ai_LookAtVector
      28:  ai_CassidyDeadeyeCharge
      29:  ai_CassidyDeadeyeRate
      30:  ai_OptimalDistance
      31:  ai_OptimalDistanceDefault
      32:  ai_ProjectileSpeed
      33:  ai_ProjectileSpeeds
      34:  ai_ReactionTime
      35:  ai_StrafeDistanceMod
      36:  ai_WeaponChargeTime
      37:  ai_RetCastDistance

      //
      // Shared variables
      //
      38:  all_ChangingHero
      39:  all_Index
      40:  all_InspireHealID
      41:  all_InspireHealTime
      42:  all_Kills
      43:  all_SubArg

      //
      // Bot variables
      //
      44:  bot_BotResetComplete
      45:  bot_MoveCrouchChanceMod
      46:  bot_MoveCrouchEnabled
      47:  bot_MoveCrouchTimeMod
      48:  bot_MoveJumpChanceMod
      49:  bot_MoveJumpEnabled
      50:  bot_MoveJumpTimeMod
      51:  bot_MoveWASDEnabled
      52:  bot_MoveWASDTimeMod
      53:  bot_Name
      54:  bot_ThrottleDir

      //
      // HUD variables
      //
      55:  hud_Debug
      56:  hud_DebugEnabled
      57:  hud_i
      58:  hud_Info
      59:  hud_InfoEnabled
      60:  hud_Main
      61:  hud_SkyMenu
      62:  hud_SkyMenuArrowsVisibleTo
      63:  hud_SkyMenuIsOpen
      64:  hud_SkyMenuSelection
      65:  hud_SkyMenuSound
      66:  hud_SkyMenuVectors
      67:  hud_SkyMenuVisibleTo

      //
      // Player variables
      //
      68:  p_BotHeroRole
      69:  p_BotHeroNumber
      70:  p_BotHeroNumberNext
      71:  p_BotTPDistance
      72:  p_CameraEyePos
      73:  p_CameraLookAtPos
      74:  p_DamageModDealtID
      75:  p_DamageModReceivedID
      76:  p_Difficulty
      77:  p_DifficultyNames
      78:  p_Effects
      79:  p_EffectsColor
      80:  p_ElevatorEnabled
      81:  p_ElevatorHeight
      82:  p_ElevatorPosition
      83:  p_EnemyDistanceMax
      84:  p_EnemyDistanceMod
      85:  p_HelpTargetIndicator
      86:  p_HeroRoleNames
      87:  p_HeroList
      88:  p_HeroListName
      89:  p_HeroNumberMod
      90:  p_HomeVector
      91:  p_KillGoal
      92:  p_Language
      93:  p_KillsLostOnDeath
      94:  p_MirrorModeEnabled
      95:  p_OneSecCooldown
      96:  p_PlayerHero
      97:  p_PlayerInitialized
      98:  p_QuickModeEnabled
      99:  p_Invulnerable
      100: p_ZoneRadius
      101: p_BotFlickerEnabled
      102: p_HealingEnabled
      103: p_BotHealingEnabled
      104: p_BotUltimateDisabled
      105: p_Preset
      106: p_PresetName
}

subroutines
{
   //
   // AI subroutines
   //
   0: aiSub_Abilities_Ana
   1: aiSub_Abilities_Ashe
   2: aiSub_Abilities_Baptiste
   3: aiSub_Abilities_Bastion
   4: aiSub_Abilities_Brigitte
   5: aiSub_Abilities_Doomfist
   6: aiSub_Abilities_DVa
   7: aiSub_Abilities_Echo
   8: aiSub_Abilities_Genji
   9: aiSub_Abilities_Hanzo
   10: aiSub_Abilities_Junkrat
   11: aiSub_Abilities_Lucio
   12: aiSub_Abilities_Cassidy
   13: aiSub_Abilities_Mei
   14: aiSub_Abilities_Mercy
   15: aiSub_Abilities_Moira
   16: aiSub_Abilities_Orisa
   17: aiSub_Abilities_Pharah
   18: aiSub_Abilities_Reaper
   19: aiSub_Abilities_Reinhardt
   20: aiSub_Abilities_Roadhog
   21: aiSub_Abilities_Sigma
   22: aiSub_Abilities_Soldier76
   23: aiSub_Abilities_Sombra
   24: aiSub_Abilities_Symmetra
   25: aiSub_Abilities_Torbjorn
   26: aiSub_Abilities_Tracer
   27: aiSub_Abilities_Widowmaker
   28: aiSub_Abilities_Winston
   29: aiSub_Abilities_WreckingBall
   30: aiSub_Abilities_Zarya
   31: aiSub_Abilities_Zenyatta
   32: aiSub_AimCalculation
   33: aiSub_AimModSet
   34: aiSub_ButtonsReset
   35: aiSub_EnableAI
   36: aiSub_FacingLookAt
   37: aiSub_FacingReset
   38: aiSub_FacingStart
   39: aiSub_FlickIn
   40: aiSub_FlickOut
   41: aiSub_ReactionDelay
   69: aiSub_AimMouseStop

   //
   // Shared subroutines
   //
   42: allSub_ButtonsAllow
   43: allSub_ButtonsDisallow
   44: allSub_WaitForFrame
   65: allSub_HealAfterElim
   66: allSub_HealAfterDamage

   //
   // Bot subroutines
   //
   45: botSub_MoveCrouch
   46: botSub_MoveJump
   47: botSub_MoveWASD
   48: botSub_ResetBot
   49: botSub_SetHero
   50: botSub_TeleportBot
   51: botSub_ThrottleStop

   //
   // HUD subroutines
   //
   52: hudSub_DebugToggle
   53: hudSub_InfoToggle
   54: hudSub_MainToggle
   55: hudSub_SkyMenuArrowSet
   56: hudSub_SkyMenuPlaySound
   57: hudSub_SkyMenuToggle

   //
   // Player subroutines
   //
   58: pSub_Elevator
   59: pSub_QuickMode
   60: pSub_SetDifficulty
   61: pSub_SetDistances
   62: pSub_SetHeroRole
   63: pSub_SetNames
   64: pSub_SetLanguage
   67: pSub_SetInvulnerable
   68: pSub_SetPreset
}

