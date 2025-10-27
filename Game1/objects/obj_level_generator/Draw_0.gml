/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Constantes para visual
var room_size = 64;
var half = room_size / 2;

// Cores
draw_set_color(c_white);
draw_set_alpha(1);

// Desenha as salas
for (var i = 0; i < array_length(global.room_nodes); i++) {
    var _room = global.room_nodes[i];
    var px = _room.position[0] * room_size;
    var py = _room.position[1] * room_size;

    draw_rectangle(px, py, px + room_size, py + room_size, false);
    draw_text(px + 8, py + 8, string(_room.index));
}

// Desenha as conexões
draw_set_color(c_red);
for (var i = 0; i < array_length(global.room_nodes); i++) {
    var _room = global.room_nodes[i];
    var px1 = room.position[0] * room_size + half;
    var py1 = room.position[1] * room_size + half;

    for (var j = 0; j < array_length(_room.connections_used); j++) {
        var conn = room.connections_used[j];
        var target_room = global.room_nodes[conn.targetIndex];
        var px2 = target_room.position[0] * room_size + half;
        var py2 = target_room.position[1] * room_size + half;

        draw_line(px1, py1, px2, py2);
    }
}

