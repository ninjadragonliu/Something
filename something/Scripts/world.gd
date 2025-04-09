extends Control

@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var enemies = $Enemies

@export var clear_screen : PackedScene

var enemy_in_range_left
var enemy_in_range_right
var enemies_remaining
var level_cleared = false


func _ready() -> void:
	enemies_remaining = enemies.enemies_amount
	$Health.max_value = Global.max_health
	# Connect player's signal to decrease enemy count
	player.take_damaged.connect(_on_player_damaged)
	
	var timer = Timer.new()
	timer.wait_time = 2.0  # 每 2 秒生成一个敌人
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)

	timer.timeout.connect(enemies.spawn_enemy)
	
	
	
func _process(delta: float) -> void:
	
	$Health/Label.text = str(Global.health) + "/" + str(Global.max_health)
	$EnemiesRemaining.text = "Enemies Remaining: " + str(enemies_remaining)
	$Health.value = Global.health
	

func _on_player_damaged():
	enemies_remaining -= 1  # Decrease enemy count when player is hit
	if enemies_remaining == 0:
		clear_level()

func clear_level():
	$EnemiesRemaining.text = "Enemies Remaining: " + str(enemies_remaining)
	if clear_screen:
		var popup = clear_screen.instantiate()
		var clear_label = popup.get_node("LevelCompleted")
		clear_label.text = "Level " + str(Global.level) + " Completed"
		get_tree().current_scene.add_child(popup)
		Global.unlock_next_level()  # Mark this level as cleared
		popup.show()
		
		# Pause the game
		get_tree().paused = true

		# Allow the game over screen to function while paused
		popup.process_mode = Node.PROCESS_MODE_ALWAYS

func clear_tutorial_level():
	$EnemiesRemaining.text = "Enemies Remaining: " + str(enemies_remaining)
	if clear_screen:
		var popup = clear_screen.instantiate()
		var clear_label = popup.get_node("LevelCompleted")
		clear_label.text = "Level " + str(Global.tutorial_counter) + " Completed"
		get_tree().current_scene.add_child(popup)
		Global.unlock_next_tutorial_level()
		popup.show()
		
		# Pause the game
		get_tree().paused = true

		# Allow the game over screen to function while paused
		popup.process_mode = Node.PROCESS_MODE_ALWAYS

func _on_left_pressed() -> void:
	$World/Player/AnimationPlayer.play("Attack_Normal_Left")
	if enemy_in_range_left:
		player.attack(enemy_in_range_left)
		enemies_remaining -= 1
		if not Global.tutorial_cleared:
			clear_tutorial_level()
		elif enemies_remaining == 0:
			clear_level()


func _on_right_pressed() -> void:
	$World/Player/AnimationPlayer.play("Attack_Normal_Right")
	if enemy_in_range_right:
		player.attack(enemy_in_range_right)
		enemies_remaining -= 1
		if not Global.tutorial_cleared:
			clear_tutorial_level()
		elif enemies_remaining == 0:
			clear_level()


func _on_line_left_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemy_in_range_left = body

func _on_line_right_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemy_in_range_right = body
