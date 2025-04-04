extends CharacterBody2D

@onready var game_over : PackedScene = load("res://nodes/game_over.tscn")
signal take_damaged

func attack(body : Node2D):
	#if body.is_in_group("enemy"):
		#var enemy = body.get_node("enemy")
		#enemy.take_damage(1)
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
	if body.is_in_group("enemy"):
		take_damage(1)
		body.queue_free()
		take_damaged.emit()
