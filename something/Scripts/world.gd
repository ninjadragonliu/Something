extends Control

@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var enemies = $Enemies2

var enemy_in_range_left
var enemy_in_range_right
var enemies_remaning

func _ready() -> void:
	enemies_remaning = enemies.enemies_amount
	var timer = Timer.new()
	timer.wait_time = 2.0  # 每 2 秒生成一个敌人
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)

	timer.timeout.connect(enemies.spawn_enemy)
	
	
func _process(delta: float) -> void:
	$Health/Label.text = str(Global.health) + "/100"
	#for i in range(5):
		#enemies.spawn_enemy()
	#enemies.spawn_enemy()
	$EnemiesRemaining.text = "Enemies Remaining: " + str(enemies_remaning)

func _on_left_pressed() -> void:
	# if enemy comes into line
		# attack 1 hit ko
	if enemy_in_range_left:
		#player.attack_left()
		player.attack(enemy_in_range_left)
		enemies_remaning -= 1


func _on_right_pressed() -> void:
	# if enemy comes into line
		# attack 1 hit ko
	if enemy_in_range_right:
		#player.attack_right()
		player.attack(enemy_in_range_right)
		enemies_remaning -= 1


func _on_line_left_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemy_in_range_left = body

func _on_line_right_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemy_in_range_right = body
