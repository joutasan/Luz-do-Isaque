if (keyboard_check(ord("W")) && keyboard_check(ord("A"))) {mvspd = 2;}
else if (keyboard_check(ord("W")) && keyboard_check(ord("D"))) {mvspd = 2;}
else if (keyboard_check(ord("S")) && keyboard_check(ord("A"))) {mvspd = 2;}
else if (keyboard_check(ord("S")) && keyboard_check(ord("D"))) {mvspd = 2;}
else {mvspd = 3;}

if (keyboard_check(ord("W"))) {y -= mvspd;}
if (keyboard_check(ord("A"))) {x -= mvspd;}
if (keyboard_check(ord("S"))) {y += mvspd;}
if (keyboard_check(ord("D"))) {x += mvspd;}