extends Popup


func _on_back_to_map_pressed() -> void:
	get_tree().paused = false
	Global.reset_health()
	await get_tree().process_frame
	get_tree().change_scene_to_file("res://Scenes/overworld_map.tscn")


func _on_retry_pressed() -> void:
	get_tree().paused = false
	Global.reset_health()
	await get_tree().process_frame  # Wait for the current frame to finish
	get_tree().reload_current_scene()
