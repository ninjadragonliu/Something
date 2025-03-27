extends Control

@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var enemies = $Enemies2

var enemy_in_range_left
var enemy_in_range_right

func _ready() -> void:
	var timer = Timer.new()
	timer.name = "SpawnTimer"
	timer.wait_time = 2.0
	timer.autostart = true
	timer.one_shot = false
	timer.timeout.connect(_on_spawn_timer_timeout)
	
	add_child(timer)

func _on_spawn_timer_timeout():
	if enemies.enemies_spawned_amount < enemies.enemies_amount:
		enemies.spawn_enemy()
		enemies.enemies_spawned_amount += 1
	else:
		get_node("SpawnTimer").stop()

func _process(delta: float) -> void:
	$Health/Label.text = str(Global.health) + "/100"
	#for i in range(5):
		#enemies.spawn_enemy()
	#enemies.spawn_enemy()

func _on_left_pressed() -> void:
	# if enemy comes into line
		# attack 1 hit ko
	if enemy_in_range_left:
		#player.attack_left()
		player.attack(enemy_in_range_left)


func _on_right_pressed() -> void:
	# if enemy comes into line
		# attack 1 hit ko
	if enemy_in_range_right:
		#player.attack_right()
		player.attack(enemy_in_range_right)


func _on_line_left_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemy_in_range_left = body

func _on_line_right_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemy_in_range_right = body
