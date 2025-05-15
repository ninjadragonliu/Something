extends Node

var spawn_timer : Timer
var spawn_duration : float

var enemies_amount: int

var enemies_num = 0
var enemies_speed = 1
var boss_speed = 1.5

var boss = preload("res://nodes/boss.tscn").instantiate()

func _ready() -> void:
	if Global.tutorial_cleared:
		enemies_amount = sin(Global.level*PI/2 + 3*PI/2)*Global.amplitude_Amount+Global.mapConstant_Amount+Global.level*Global.growthFactor_Amount
		enemies_speed = min(35, cos(Global.level*PI/2)*Global.amplitude_Speed+Global.mapConstant_Speed+Global.level*Global.growthFactor_Speed)
	else:
		enemies_amount = sin(Global.tutorial_counter*PI/2 + 3*PI/2)*Global.amplitude_Amount+Global.mapConstant_Amount+Global.tutorial_counter*Global.growthFactor_Amount
		enemies_speed = min(35, cos(Global.tutorial_counter*PI/2)*Global.amplitude_Speed+Global.mapConstant_Speed+Global.tutorial_counter*Global.growthFactor_Speed)
		
	boss_speed = 1.3*enemies_speed
	spawn_duration = 30/enemies_speed
	print(spawn_duration)
	spawn_timer = Timer.new()
	add_child(spawn_timer)
	spawn_timer.timeout.connect(spawn_enemy)
	spawn_timer.start(spawn_duration)

func spawn_enemy():
	if enemies_num >= enemies_amount:
		return
	
	var enemy = preload("res://nodes/enemy.tscn").instantiate()
	var spawn_position = Global.positions[randi() % Global.positions.size()]
	var animation = enemy.get_node("AnimationPlayer")

	enemy.position = spawn_position
	enemy.speed = enemies_speed+randf_range(-0.15*enemies_speed, max(0.5,0.25*enemies_speed))
	animation.speed_scale = 0.08 + enemies_speed*0.01
	add_child(enemy)
	enemies_num += 1
	
	var world = get_parent()
	if world.enemies_remaining == boss.spawn_line:
		spawn_boss()

func spawn_boss():
	var spawn_position = Global.positions[randi() % Global.positions.size()]
	var animation = boss.get_node("AnimationPlayer")

	boss.position = spawn_position
	animation.speed_scale = 0.08 + boss_speed*0.01
	add_child(boss)
