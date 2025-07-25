extends Control

@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var enemies = $Enemies
@onready var animatation = player.get_node("AnimationPlayer")
@export var clear_screen : PackedScene

var enemy_in_range_left = []
var enemy_in_range_right = []
var level_cleared = false
var enemies_remaining

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
	$EnemiesRemaining/Label.text = str(enemies_remaining)
	$Health.value = Global.health
	
func _on_player_damaged():
	enemies_remaining -= 1  # Decrease enemy count when player is hit
	#player_damaged = true
	if enemies_remaining == 0:
		clear_level()
	
func clear_level():
	$EnemiesRemaining/Label.text = str(enemies_remaining)
	if clear_screen:
		var popup = clear_screen.instantiate()
		var clear_label = popup.get_node("LevelCompleted")
		clear_label.text = "Level " + str(Global.level) + " Completed"
		get_tree().current_scene.add_child(popup)
		Global.unlock_next_level()  # Mark this level as cleared
		Global.save_game_data()
		popup.show()
		
		# Pause the game
		get_tree().paused = true

		# Allow the game over screen to function while paused
		#popup.process_mode = Node.PROCESS_MODE_ALWAYS

func clear_tutorial_level():
	$EnemiesRemaining.text = "Enemies Remaining: " + str(enemies_remaining)
	if clear_screen:
		var popup = clear_screen.instantiate()
		var clear_label = popup.get_node("LevelCompleted")
		clear_label.text = "Level " + str(Global.tutorial_counter) + " Completed"
		get_tree().current_scene.add_child(popup)
		Global.unlock_next_tutorial_level()
		Global.save_game_data()
		popup.show()
		
		# Pause the game
		get_tree().paused = true

		# Allow the game over screen to function while paused
		#popup.process_mode = Node.PROCESS_MODE_ALWAYS

func _on_left_pressed() -> void:
	if enemy_in_range_left:
		for enemy in enemy_in_range_left:
			if enemy.is_in_group("boss"):
				var boss = get_tree().get_first_node_in_group("boss")
				if boss.health == 1:
					player.attack(enemy)
					enemy_in_range_left.erase(enemy)
					enemies_remaining -= 1
					continue
				player.attack(enemy)
				enemy_in_range_left.erase(enemy)
				continue
			player.attack(enemy)
			enemy_in_range_left.erase(enemy)
			enemies_remaining -= 1
			animatation.play("Attack_Normal_Left")
			if not Global.tutorial_cleared:
				clear_tutorial_level()
			elif enemies_remaining == 0:
				clear_level()

func _on_right_pressed() -> void:
	if enemy_in_range_right:
		for enemy in enemy_in_range_right:
			if enemy.is_in_group("boss"):
				var boss = get_tree().get_first_node_in_group("boss")
				if boss.health == 1:
					player.attack(enemy)
					enemy_in_range_right.erase(enemy)
					enemies_remaining -= 1
					continue
				player.attack(enemy)
				enemy_in_range_right.erase(enemy)
				continue
			player.attack(enemy)
			enemy_in_range_right.erase(enemy)
			enemies_remaining -= 1
			animatation.play("Attack_Normal_Right")
			if not Global.tutorial_cleared:
				clear_tutorial_level()
			elif enemies_remaining == 0:
				clear_level()

func _on_line_left_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy") or body.is_in_group("boss"):
		enemy_in_range_left.append(body)

func _on_line_right_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy") or body.is_in_group("boss"):
		enemy_in_range_right.append(body)


func _on_skills_pressed() -> void:
	print("Skill actived")
	if Global.active_skill_list[Global.saving_list[7][4]][0] == "DamageReduction":
		Global.reduce_count = 3
		Global.reduce_amount = 2
		$Skills.disabled = true
	print("timer activated")
#	var timer = Timer.new()
#	timer.wait_time = 4
#	timer.one_shot = true
#	timer.autostart = true
#	add_child(timer)
#	player.damage_resistance += 1
#	timer.timeout.connect(_on_skill_timer_timerout)  # Auto-delete itself

	#if Global.health + 3 > Global.max_health:
		#Global.health = Global.max_health
	#else:
		#Global.health += 3
	#player.damage += 2
	
	# Connect the timeout signal
	
	
	#print(player.damage)

func _on_skill_timer_timerout():
	#player.damage = player.damage_normal
	player.damage_resistance = player.damage_resistance_normal
	
func _on_fist_pressed() -> void:
	player.change_weapon()
	print("Weapon 1 selected")
	

func _on_sword_pressed() -> void:
	player.change_weapon()
	print("Weapon 2 selected")


func _on_lance_pressed() -> void:
	player.change_weapon()
	print("Weapon 3 selected")
