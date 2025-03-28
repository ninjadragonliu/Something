extends Node

var enemies_num = 0

@export var enemies_amount = 10
var enemies_speed = 1
var boss_speed = 1.5
var spawn_duration = 0.1

var positions  = [
	Vector2(1, 150),
	Vector2(1, 400),
	Vector2(1150, 150),
	Vector2(1150, 400)
]

func _ready() -> void:
	#enemies = get_tree().get_nodes_in_group("enemy")
	pass

func spawn_enemy():
	if enemies_num >= enemies_amount:
		return
	
	var enemy_scene = preload("res://nodes/enemy.tscn")
	var enemy = enemy_scene.instantiate()
	var spawn_position = positions[randi() % positions.size()]

	enemy.position = spawn_position
	enemy.speed = enemies_speed
	add_child(enemy)
	enemies_num += 1
