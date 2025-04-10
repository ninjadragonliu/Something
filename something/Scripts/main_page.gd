extends Control

var profile : PackedScene = load("res://nodes/profile.tscn")

func _ready() -> void:
	$Panel/VBoxContainer/ID.text = "ID: " + Global.player_id
	
func _process(delta: float) -> void:
	$Panel/VBoxContainer/PlayerName.text = "Player Name: " + Global.player_name
	$Panel/Coins.text = "Coins: " + str(Global.coins)
	
func _on_events_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/events.tscn")


func _on_play_pressed() -> void:
	if Global.tutorial_cleared:
		get_tree().change_scene_to_file("res://Scenes/overworld_map.tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")

func _on_settings_pressed() -> void:
	pass # Replace with function body.

func _on_shop_pressed() -> void:
	pass # Replace with function body.

func _on_character_pressed() -> void:
	pass # Replace with function body.

func _on_profile_pic_pressed() -> void:
	if profile:
		var popup = profile.instantiate()
		get_tree().current_scene.add_child(popup)
		popup.show()
		
				# Pause the game
		get_tree().paused = true

		# Allow the game over screen to function while paused
		popup.process_mode = Node.PROCESS_MODE_ALWAYS
