extends Control


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_page.tscn")


func _on_button_1_pressed() -> void:
	Global.level = 1
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_button_2_pressed() -> void:
	Global.level = 2
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_button_3_pressed() -> void:
	Global.level = 3
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_button_4_pressed() -> void:
	Global.level = 4
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_button_5_pressed() -> void:
	Global.level = 5
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_button_6_pressed() -> void:
	Global.level = 6
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_button_7_pressed() -> void:
	Global.level = 7
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_button_8_pressed() -> void:
	Global.level = 8
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_button_9_pressed() -> void:
	Global.level = 9
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_button_10_pressed() -> void:
	Global.level = 10
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_button_11_pressed() -> void:
	Global.level = 11
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
