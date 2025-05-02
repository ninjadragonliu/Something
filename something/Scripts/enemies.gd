extends Node

var spawn_timer : Timer

@export var enemies_amount: int

var enemies_num = 0
var enemies_speed = 1
var boss_speed = 1.5
var spawn_duration : float = 0.1

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
		
	boss_speed = 1.3*enemies_speed
	spawn_duration = 0.1 - 0.03*enemies_speed 
	spawn_timer = Timer.new()
	add_child(spawn_timer)
	spawn_timer.timeout.connect(spawn_enemy)
	spawn_timer.start(spawn_duration)

func spawn_enemy():
	if enemies_num >= enemies_amount:
		return
	
	var enemy_scene = preload("res://nodes/enemy.tscn")
	var enemy = enemy_scene.instantiate()
	var spawn_position = positions[randi() % positions.size()]
	var animation = enemy.get_node("AnimationPlayer")

	enemy.position = spawn_position
	enemy.speed = enemies_speed+randf_range(-0.15*enemies_speed, max(0.5,0.2*enemies_speed))
	enemy.speed = enemies_speed+randf_range(-0.15*enemies_speed, max(0.5,0.25*enemies_speed))
	animation.speed_scale = 0.08 + enemies_speed*0.01
	add_child(enemy)
	enemies_num += 1
