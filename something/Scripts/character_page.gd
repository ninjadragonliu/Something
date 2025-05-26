extends Control

func _ready() -> void:
	$Equipment/Weapon2.button_pressed = true
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_page.tscn")
