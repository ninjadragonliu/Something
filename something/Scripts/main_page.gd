extends Control


func _on_events_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/events.tscn")
