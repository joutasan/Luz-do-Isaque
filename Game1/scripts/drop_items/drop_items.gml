function drop_items()
{
    if (!variable_instance_exists(id, "drop_table")) return;

    for (var i = 0; i < array_length(drop_table); i++)
    {
        var item = drop_table[i][0];
        var chance = drop_table[i][1];

        if (random(1) < chance)
        {
            instance_create_layer(x, y, "Drops", item);
        }
    }
}