if (instance_exists(MugenObj) && MugenObj.attacking) {
    other.hp -= dmg;
    dmg = 0;
    alarm[0] = 55;
}
