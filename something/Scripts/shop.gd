extends Control

func _ready() -> void:
	$VBoxContainer/Costume.button_pressed = true

func _on_back_pressed() -> void:
	Global.save_game_data()
	get_tree().change_scene_to_file("res://Scenes/main_page.tscn")


func _on_costume_pressed() -> void:
	$VBoxContainer/Costume.button_pressed = true
	$VBoxContainer/Skills.button_pressed = false
	$VBoxContainer/Weapons.button_pressed = false
	$VBoxContainer/Equipment.button_pressed = false
	$Costume.show()
	$Skills.hide()
	$Weapons.hide()
	$Equipment.hide()

func _on_skills_pressed() -> void:
	$VBoxContainer/Skills.button_pressed = true
	$VBoxContainer/Costume.button_pressed = false
	$VBoxContainer/Weapons.button_pressed = false
	$VBoxContainer/Equipment.button_pressed = false
	$Costume.hide()
	$Skills.show()
	$Weapons.hide()
	$Equipment.hide()


func _on_weapons_pressed() -> void:
	$VBoxContainer/Weapons.button_pressed = true
	$VBoxContainer/Skills.button_pressed = false
	$VBoxContainer/Costume.button_pressed = false
	$VBoxContainer/Equipment.button_pressed = false
	$Weapons.show()
	$Costume.hide()
	$Skills.hide()
	$Equipment.hide()

	
func _on_equipment_pressed() -> void:
	$VBoxContainer/Equipment.button_pressed = true
	$VBoxContainer/Skills.button_pressed = false
	$VBoxContainer/Costume.button_pressed = false
	$VBoxContainer/Weapons.button_pressed = false
	$Equipment.show()
	$Weapons.hide()
	$Skills.hide()
	$Costume.hide()
