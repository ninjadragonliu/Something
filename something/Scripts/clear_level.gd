extends Popup


func _on_ok_pressed() -> void:
	if Global.tutorial_cleared:
		get_tree().paused = false
		Global.reset_health()
		await get_tree().process_frame
		get_tree().change_scene_to_file("res://Scenes/overworld_map.tscn")
	else:
		get_tree().paused = false
		Global.reset_health()
		await get_tree().process_frame
		get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")


func _on_next_level_pressed() -> void:
	pass # Replace with function body.
