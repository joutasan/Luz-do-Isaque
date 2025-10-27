/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Direções
enum Direction {
    Up,
    Down,
    Left,
    Right
}

// Struct da conexão da porta
function DoorConnection(_direction, _targetIndex) {
    return {
        direction: _direction,
        targetIndex: _targetIndex
    };
}

// Struct da sala
function RoomNode(_x, _y, _index) {
    return {
        index: _index,
        position: [ _x, _y ],
        connections_used: [],
        connections_available: [
            DoorConnection(Direction.Up, -1),
            DoorConnection(Direction.Down, -1),
            DoorConnection(Direction.Left, -1),
            DoorConnection(Direction.Right, -1)
        ]
    };
}

// Inicialização
var total_rooms = 15;
var current_index = 0;
global.room_nodes = [];

var start_room = RoomNode(0, 0, current_index);
array_push(global.room_nodes, start_room);
current_index++;

var current_room = start_room;

// Loop para gerar salas
for (var i = 1; i < total_rooms; i++) {
    var new_room_created = false;

    while (!new_room_created) {
        if (array_length(current_room.connections_available) == 0) {
            current_room = global.room_nodes[irandom(array_length(global.room_nodes) - 1)];
            continue;
        }

        var dir_index = irandom(array_length(current_room.connections_available) - 1);
        var conn = current_room.connections_available[dir_index];

        array_delete(current_room.connections_available, dir_index, 1);
        array_push(current_room.connections_used, conn);

        var new_x = current_room.position[0];
        var new_y = current_room.position[1];

        switch (conn.direction) {
            case Direction.Up:    new_y -= 1; break;
            case Direction.Down:  new_y += 1; break;
            case Direction.Left:  new_x -= 1; break;
            case Direction.Right: new_x += 1; break;
        }

        // Verifica se já existe sala nessa posição
        var exists = false;
        for (var j = 0; j < array_length(global.room_nodes); j++) {
            var _room = global.room_nodes[j];
            if (_room.position[0] == new_x && _room.position[1] == new_y) {
                exists = true;
                break;
            }
        }

        if (exists) continue;

        var new_room = RoomNode(new_x, new_y, current_index);
        current_index++;
        array_push(global.room_nodes, new_room);

        var opposite = (conn.direction + 2) % 4;
        array_push(new_room.connections_used, DoorConnection(opposite, current_room.index));

        new_room_created = true;

        var roll = irandom(2);
        if (roll == 0) current_room = new_room;
        else if (roll == 1) current_room = global.room_nodes[irandom(array_length(global.room_nodes) - 1)];
    }
}
