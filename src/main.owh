settings
{
	main
	{
		Description: "Practice Field: Expanse is a tool for practicing against dummy bots with AI for all Heroes. (한국어 옵션 포함!)  ♥  This is a Pre-Release Beta Version!  ♥  Import Code: 5DPKQ  ♥  Created by Snow#15707  ♥  If you modify this mode and share your modification, please prepend \"Modified by: [your battletag]\" to this description."
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
			Ultimate Generation: 200%

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
		0: buildDate
		1: colorDarkPink
		2: colorDarkTeal
		3: colorLightGrey
		4: colorLightPink
		5: colorLightTeal
		6: difficultyMax
		7: discordInvite
		8: effectColors
		9: g_BotHealing
		10: g_DebugHero
		11: g_DebugHUD
		12: g_DebugMode
		13: g_Difficulty
		14: g_HeroClass
		15: g_KillGoal
		16: g_Language
		17: g_OneSecCooldown
		18: g_PlayerHealing
		19: gameTick
		20: githubURL
		21: heroClasses
		22: largePlayerZoneHeroes
		23: longDistance
		24: longRangeHeroes
		25: mediumDistance
		26: mediumRangeHeroes
		27: moveDirAll
		28: moveDirBackwards
		30: moveDirForwards
		32: moveDirStrafe
		33: playerBubbleRadius
		34: playerZoneRadiusDefault
		35: programmerName
		36: projectileHeroes
		37: pseudoInfinity
		38: scopeHeroes
		39: shortDistance
		40: shortRangeHeroes
		41: twitchURL
		42: version
		43: veryShortDistance
		44: veryShortRangeHeroes
		45: workshopCode
		46: hud_MainVisibleToEN
		47: hud_InfoVisibleToEN
		48: hud_MainVisibleToKR
		49: hud_InfoVisibleToKR
		50: namesBotNames
		51: namesUseNames

	player:
		0: ai_AbilityButton
		1: ai_AbilityOpt
		2: ai_AIEnabled
		3: ai_AimBase
		4: ai_AimBaseDefault
		5: ai_AimDistanceMod
		6: ai_AimModX
		7: ai_AimModY
		8: ai_AimStopTime
		9: ai_AimTurnRate
		10: ai_AimType
		11: ai_AimTypeDefault
		12: ai_BMVoiceLine
		13: ai_CanAim
		14: ai_CanAttack
		15: ai_CanUseAbilities
		16: ai_ChanceMod
		17: ai_DoomfistPunchDamage
		18: ai_DoomfistPunchTime
		19: ai_FacingAngleMod
		20: ai_FacingAnglePow
		21: ai_FacingCapMax
		22: ai_FacingCapMin
		23: ai_FacingPadMax
		24: ai_FacingPadMin
		25: ai_FacingRelPosMod
		26: ai_HeroInitialized
		27: ai_IsInAbilitySub
		28: ai_LookAtVector
		29: ai_McCreeDeadeyeCharge
		30: ai_McCreeDeadeyeRate
		31: ai_OptimalDistance
		32: ai_OptimalDistanceDefault
		33: ai_ProjectileSpeed
		34: ai_ProjectileSpeeds
		35: ai_ReactionTime
		36: ai_StrafeDistanceMod
		37: ai_UltimateDisabled
		38: ai_ViewAngleMod
		39: ai_WeaponChargeTime
		40: all_ChangingHero
		41: all_HealingEnabled
		42: all_InspireHealID
		43: all_InspireHealTime
		44: all_Kills
		45: all_SubArg
		46: bot_BotResetComplete
		47: bot_FlickerEnabled
		48: bot_MoveCrouchChanceMod
		49: bot_MoveCrouchEnabled
		50: bot_MoveCrouchTimeMod
		51: bot_MoveJumpChanceMod
		52: bot_MoveJumpEnabled
		53: bot_MoveJumpTimeMod
		54: bot_MoveWASDEnabled
		55: bot_MoveWASDTimeMod
		56: bot_ThrottleDir
		57: hud_Debug
		58: hud_DebugEnabled
		59: hud_i
		60: hud_Info
		61: hud_InfoEnabled
		62: hud_Main
		63: hud_SkyMenu
		64: hud_SkyMenuArrowsVisibleTo
		65: hud_SkyMenuIsOpen
		66: hud_SkyMenuSelection
		67: hud_SkyMenuSound
		68: hud_SkyMenuVectors
		69: hud_SkyMenuVisibleTo
		70: index
		71: p_BotHeroClass
		72: p_BotHeroNumber
		73: p_BotHeroNumberNext
		74: p_BotTPDistance
		75: p_CameraEyePos
		76: p_CameraLookAtPos
		77: p_DamageModDealtID
		78: p_DamageModReceivedID
		79: p_Difficulty
		80: p_DifficultyNames
		81: p_Effects
		82: p_EffectsColor
		83: p_ElevatorEnabled
		84: p_ElevatorHeight
		85: p_ElevatorPosition
		86: p_EnemyDistanceMax
		87: p_EnemyDistanceMod
		88: p_HelpTargetIndicator
		89: p_HeroClassNames
		90: p_HeroList
		91: p_HeroListName
		92: p_HeroNumberMod
		93: p_HomeVector
		94: p_KillGoal
		95: p_Language
		96: p_MinusKillOnDeath
		97: p_MirrorModeEnabled
		98: p_OneSecCooldown
		99: p_PlayerHero
		100: p_PlayerInitialized
		101: p_QuickModeEnabled
		102: p_Unkillable
		103: p_ZoneRadius
		104: bot_Name
}

subroutines
{
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
	12: aiSub_Abilities_McCree
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
	42: allSub_ButtonsAllow
	43: allSub_ButtonsDisallow
	44: allSub_WaitForFrame
	45: botSub_MoveCrouch
	46: botSub_MoveJump
	47: botSub_MoveWASD
	48: botSub_ResetBot
	49: botSub_SetHero
	50: botSub_TeleportBot
	51: botSub_ThrottleStop
	52: hudSub_DebugToggle
	53: hudSub_InfoToggle
	54: hudSub_MainToggle
	55: hudSub_SkyMenuArrowSet
	56: hudSub_SkyMenuPlaySound
	57: hudSub_SkyMenuToggle
	58: pSub_Elevator
	59: pSub_QuickMode
	60: pSub_SetDifficulty
	61: pSub_SetDistances
	62: pSub_SetHeroClass
	63: pSub_SetNames
	64: pSub_SetLanguage
}

