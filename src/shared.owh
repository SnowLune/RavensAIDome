rule("allSub_WaitForFrame")
{
	event
	{
		Subroutine;
		allSub_WaitForFrame;
	}

	actions
	{
		Wait Until(((Slot Of(Event Player) % 2 == 0 && Global.g_Tick % 2 == 0) || (Slot Of(Event Player)
			% 2 != 0 && Global.g_Tick % 2 != 0)) == True, 2 / 60);
		Wait(0.500 / 60, Ignore Condition);
	}
}

rule("allSub_ButtonsDisallow")
{
	event
	{
		Subroutine;
		allSub_ButtonsDisallow;
	}

	actions
	{
		Disallow Button(Event Player, Button(Primary Fire));
		Disallow Button(Event Player, Button(Secondary Fire));
		Disallow Button(Event Player, Button(Ability 1));
		Disallow Button(Event Player, Button(Ability 2));
		Disallow Button(Event Player, Button(Ultimate));
		Disallow Button(Event Player, Button(Jump));
		Disallow Button(Event Player, Button(Crouch));
		Disallow Button(Event Player, Button(Melee));
		Disallow Button(Event Player, Button(Reload));
	}
}

rule("allSub_ButtonsAllow")
{
	event
	{
		Subroutine;
		allSub_ButtonsAllow;
	}

	actions
	{
		Allow Button(Event Player, Button(Primary Fire));
		Allow Button(Event Player, Button(Secondary Fire));
		Allow Button(Event Player, Button(Ability 1));
		Allow Button(Event Player, Button(Ability 2));
		Allow Button(Event Player, Button(Ultimate));
		Allow Button(Event Player, Button(Jump));
		Allow Button(Event Player, Button(Crouch));
		Allow Button(Event Player, Button(Melee));
		Allow Button(Event Player, Button(Reload));
	}
}

