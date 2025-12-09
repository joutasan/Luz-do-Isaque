/// obj_GameController Step Event

// Only check once
if (!demo_finished)
{
    // Check if all enemy instances are gone
    if (instance_number(MonsterObj) == 0 &&
        instance_number(SpitterObj) == 0 &&
        instance_number(Bat) == 0)
    {
        demo_finished = true;
		alarm[0] = 300
        show_debug_message("Demo finished triggered!"); // optional for testing
    }
}
