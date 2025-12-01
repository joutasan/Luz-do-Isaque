// Collision event: Spit vs MugenObj
MugenObj.hp -= 2;  // reduce HP of the Mugen instance collided with
instance_destroy(); // destroys only this spit instance
