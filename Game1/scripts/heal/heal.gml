function heal(amount)
{
    var h = instance_find(HeartCount, 0);
    hp += amount;

    if (hp > max_hp) hp = max_hp;

    if (h != noone)
    {
        h.image_index -= amount;   // negative index = hearts fill
        if (h.image_index < 0) h.image_index = 0;
    }
}
