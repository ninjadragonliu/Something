extends Control
signal tab_changed(tab_name: String)

func _ready() -> void:
	$ScrollContainer/VBoxContainer/Featured.button_pressed = true

func _process(delta: float) -> void:
	$VBoxContainer2/Coins/Label.text = str(Global.coins)
	$VBoxContainer2/Diamonds/Label.text =  str(Global.diamonds)

func _on_back_pressed() -> void:
	Global.save_game_data()
	get_tree().change_scene_to_file("res://Scenes/main_page.tscn")

func _on_costume_pressed1() -> void:
	$ScrollContainer/VBoxContainer/Costume.button_pressed = true
	$ScrollContainer/VBoxContainer/Skills.button_pressed = false
	$ScrollContainer/VBoxContainer/Weapons.button_pressed = false
	$ScrollContainer/VBoxContainer/Equipment.button_pressed = false
	$ScrollContainer/VBoxContainer/Featured.button_pressed = false
	$Costume.show()
	$Skills.hide()
	$Weapons.hide()
	$Equipment.hide()
	$Featured.hide()

func _on_skills_pressed() -> void:
	$ScrollContainer/VBoxContainer/Costume.button_pressed = false
	$ScrollContainer/VBoxContainer/Skills.button_pressed = true
	$ScrollContainer/VBoxContainer/Weapons.button_pressed = false
	$ScrollContainer/VBoxContainer/Equipment.button_pressed = false
	$ScrollContainer/VBoxContainer/Featured.button_pressed = false
	$Costume.hide()
	$Skills.show()
	$Weapons.hide()
	$Equipment.hide()
	$Featured.hide()

func _on_weapons_pressed() -> void:
	$ScrollContainer/VBoxContainer/Costume.button_pressed = false
	$ScrollContainer/VBoxContainer/Skills.button_pressed = false
	$ScrollContainer/VBoxContainer/Weapons.button_pressed = true
	$ScrollContainer/VBoxContainer/Equipment.button_pressed = false
	$ScrollContainer/VBoxContainer/Featured.button_pressed = false
	$Weapons.show()
	$Costume.hide()
	$Skills.hide()
	$Equipment.hide()
	$Featured.hide()

func _on_equipment_pressed() -> void:
	$ScrollContainer/VBoxContainer/Costume.button_pressed = false
	$ScrollContainer/VBoxContainer/Skills.button_pressed = false
	$ScrollContainer/VBoxContainer/Weapons.button_pressed = false
	$ScrollContainer/VBoxContainer/Equipment.button_pressed = true
	$ScrollContainer/VBoxContainer/Featured.button_pressed = false
	$Equipment.show()
	$Weapons.hide()
	$Skills.hide()
	$Costume.hide()
	$Featured.hide()

func _on_featured_pressed() -> void:
	$ScrollContainer/VBoxContainer/Costume.button_pressed = false
	$ScrollContainer/VBoxContainer/Skills.button_pressed = false
	$ScrollContainer/VBoxContainer/Weapons.button_pressed = false
	$ScrollContainer/VBoxContainer/Equipment.button_pressed = false
	$ScrollContainer/VBoxContainer/Featured.button_pressed = true
	$Featured.show()
	$Equipment.hide()
	$Weapons.hide()
	$Skills.hide()
	$Costume.hide()

func _on_costume_pressed() -> void:
	if $ScrollContainer/VBoxContainer/Costume/Costume.button_down:
		$ScrollContainer/VBoxContainer/Costume/Hair.show()
		$ScrollContainer/VBoxContainer/Costume/Top.show()
		$ScrollContainer/VBoxContainer/Costume/Bottom.show()
		$ScrollContainer/VBoxContainer/Costume/Costume.button_pressed = true
	else:
		$ScrollContainer/VBoxContainer/Costume/Hair.hide()
		$ScrollContainer/VBoxContainer/Costume/Top.hide()
		$ScrollContainer/VBoxContainer/Costume/Bottom.hide()
		$ScrollContainer/VBoxContainer/Costume/Costume.button_pressed = false
