extends CharacterBody2D

@onready var game_over : PackedScene = load("res://nodes/game_over.tscn")
signal take_damaged
signal boss_hit_player

func attack(body : Node2D):
	body.take_damage(1)

func take_damage(damage: int):
	Global.health -= damage
	if Global.health <= 0:
		var popup = game_over.instantiate()
		get_tree().current_scene.add_child(popup)
		popup.show()

		# Pause the game
		get_tree().paused = true

		# Allow the game over screen to function while paused
		popup.process_mode = Node.PROCESS_MODE_ALWAYS

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("boss"):
		take_damage(body.attack)
		var current_scene = get_tree().current_scene
		if current_scene:
			# Remove from left array if it's in range
			if current_scene.enemy_in_range_left.has(body):
				current_scene.enemy_in_range_left.erase(body)
				#print("✅ Removed enemy from left array:", body)

			# Remove from right array if it's in range
			if current_scene.enemy_in_range_right.has(body):
				current_scene.enemy_in_range_right.erase(body)
				#print("✅ Removed enemy from right array:", body)
		body.position = Global.positions[randi() % Global.positions.size()]
		boss_hit_player.emit()

	if body.is_in_group("enemy"):
		var explosion = preload("res://nodes/explosion.tscn").instantiate()
		explosion.position = body.position
		var current_scene = get_tree().current_scene
		take_damage(1)
		current_scene.add_child(explosion)
		
		if current_scene:
			# Remove from left array if it's in range
			if current_scene.enemy_in_range_left.has(body):
				current_scene.enemy_in_range_left.erase(body)
				#print("✅ Removed enemy from left array:", body)

			# Remove from right array if it's in range
			if current_scene.enemy_in_range_right.has(body):
				current_scene.enemy_in_range_right.erase(body)
				#print("✅ Removed enemy from right array:", body)
				
		body.queue_free()
		take_damaged.emit()
