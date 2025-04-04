extends Control

func _ready() -> void:
	$Panel/VBoxContainer/PlayerName.text = "Player Name: " + Global.player_name
	$Panel/VBoxContainer/ID.text = "ID: " + Global.player_id

func _on_events_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/events.tscn")


func _on_play_pressed() -> void:
	if Global.tutorial_cleared:
		get_tree().change_scene_to_file("res://Scenes/overworld_map.tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")
