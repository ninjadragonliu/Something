extends Control


func _on_events_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/events.tscn")


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/overworld_map.tscn")
