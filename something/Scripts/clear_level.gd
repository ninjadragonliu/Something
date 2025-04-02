extends Popup


func _on_ok_pressed() -> void:
	get_tree().paused = false
	await get_tree().process_frame
	get_tree().change_scene_to_file("res://Scenes/overworld_map.tscn")
