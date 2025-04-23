extends Node

var enemies_num = 0

@export var enemies_amount: int

var enemies_speed = 1
var boss_speed = 1.5
var spawn_duration = 0.1

var positions  = [
	Vector2(1, 100),
	Vector2(1, 400),
	Vector2(1150, 100),
	Vector2(1150, 400)
]

func _ready() -> void:
	if Global.tutorial_cleared:
		enemies_amount = sin(Global.level*PI/2 + 3*PI/2)*Global.amplitude_Amount+Global.mapConstant_Amount+Global.level*Global.growthFactor_Amount
		enemies_speed = min(30, cos(Global.level*PI/2)*Global.amplitude_Speed+Global.mapConstant_Speed+Global.level*Global.growthFactor_Speed)
	else:
		enemies_amount = sin(Global.tutorial_counter*PI/2 + 3*PI/2)*Global.amplitude_Amount+Global.mapConstant_Amount+Global.tutorial_counter*Global.growthFactor_Amount
		enemies_speed = min(30, cos(Global.tutorial_counter*PI/2)*Global.amplitude_Speed+Global.mapConstant_Speed+Global.tutorial_counter*Global.growthFactor_Speed)

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
