extends Control

func _ready() -> void:
	$Equipment/Weapon2.button_pressed = true
	$Equipment.show()
	$VBoxContainer/Equip.button_pressed = true

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_page.tscn")


func _on_equip_pressed() -> void:
	$Equipment.show()
	$Skill.hide()
	$Customize.hide()
	$VBoxContainer/Equip.button_pressed = true
	$VBoxContainer/Skill.button_pressed = false
	$VBoxContainer/Customize.button_pressed = false


func _on_skill_pressed() -> void:
	$Equipment.hide()
	$Skill.show()
	$Customize.hide()
	$VBoxContainer/Equip.button_pressed = false
	$VBoxContainer/Skill.button_pressed = true
	$VBoxContainer/Customize.button_pressed = false

func _on_customize_pressed() -> void:
	$Equipment.hide()
	$Skill.hide()
	$Customize.show()
	$VBoxContainer/Equip.button_pressed = false
	$VBoxContainer/Skill.button_pressed = false
	$VBoxContainer/Customize.button_pressed = true

func _on_weapon_2_pressed() -> void:
	$Equipment/Weapon.show()
	$Equipment/Armor.hide()
	$Equipment/Placeholder.hide()

func _on_armor_2_pressed() -> void:
	$Equipment/Weapon.hide()
	$Equipment/Armor.show()
	$Equipment/Placeholder.hide()

func _on_placeholder_2_pressed() -> void:
	$Equipment/Weapon.hide()
	$Equipment/Armor.hide()
	$Equipment/Placeholder.show()
