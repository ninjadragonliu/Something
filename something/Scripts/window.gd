extends Window



func _on_ok_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/overworld_map.tscn")
	self.hide()
