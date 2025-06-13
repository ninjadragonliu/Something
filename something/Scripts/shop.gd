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

func _on_featured_pressed() -> void:
	$Featured.show()
	$Equipment.hide()
	$Weapons.hide()
	$Skills.hide()
	$Costume.hide()
	for child in $ScrollContainer/VBoxContainer/Costume.get_children():
		if child.name.begins_with("Costume"):
			continue
		child.button_pressed = false

func _on_costume_toggled(toggled_on: bool) -> void:
	if toggled_on:
		#$Costume.show()
		#$Featured.hide()
		for child in $ScrollContainer/VBoxContainer/Costume.get_children():
			child.show()
	else:
		#$Costume.hide()
		for child in $Costume.get_children():
			child.hide()
		for child in $ScrollContainer/VBoxContainer/Costume.get_children():
			if child.name.begins_with("Costume"):
				continue
			child.button_pressed = false
			child.hide()

func _on_skills_toggled(toggled_on: bool) -> void:
	if toggled_on:
		for child in $ScrollContainer/VBoxContainer/Skills.get_children():
			child.show()
	else:
		for child in $Skills.get_children():
			child.hide()
		for child in $ScrollContainer/VBoxContainer/Skills.get_children():
			if child.name.begins_with("Skills"):
				continue
			child.button_pressed = false
			child.hide()

func _on_weapons_toggled(toggled_on: bool) -> void:
	if toggled_on:
		for child in $ScrollContainer/VBoxContainer/Weapons.get_children():
			child.show()
	else:
		for child in $Weapons.get_children():
			child.hide()
		for child in $ScrollContainer/VBoxContainer/Weapons.get_children():
			if child.name.begins_with("Weapons"):
				continue
			child.button_pressed = false
			child.hide()

func _on_equipment_toggled(toggled_on: bool) -> void:
	if toggled_on:
		for child in $ScrollContainer/VBoxContainer/Equipment.get_children():
			child.show()
	else:
		for child in $Equipment.get_children():
			child.hide()
		for child in $ScrollContainer/VBoxContainer/Equipment.get_children():
			if child.name.begins_with("Equipment"):
				continue
			child.button_pressed = false
			child.hide()

func _on_hair_pressed() -> void:
	$Costume.show()
	$Featured.hide()
	for child in $ScrollContainer/VBoxContainer/Costume.get_children():
		if child.name.begins_with("Costume"):
			continue
		elif child.name.begins_with("Hair"):
			child.button_pressed = true
			continue
		child.button_pressed = false

	for child in $Costume.get_children():
		if child.name.begins_with("Hair"):
			child.show()
			continue
		child.hide()

func _on_costop_pressed() -> void:
	$Costume.show()
	$Featured.hide()
	for child in $ScrollContainer/VBoxContainer/Costume.get_children():
		if child.name.begins_with("Costume"):
			continue
		elif child.name.begins_with("CosTop"):
			child.button_pressed = true
			continue
		child.button_pressed = false

	for child in $Costume.get_children():
		if child.name.begins_with("Top"):
			child.show()
			continue
		child.hide()

func _on_cosbottom_pressed() -> void:
	$Costume.show()
	$Featured.hide()
	for child in $ScrollContainer/VBoxContainer/Costume.get_children():
		if child.name.begins_with("Costume"):
			continue
		elif child.name.begins_with("CosBottom"):
			child.button_pressed = true
			continue
		child.button_pressed = false
	
	for child in $Costume.get_children():
		if child.name.begins_with("Bottom"):
			child.show()
			continue
		child.hide()

func _on_active_pressed() -> void: # active skills
	$Skills.show()
	$Featured.hide()
	for child in $ScrollContainer/VBoxContainer/Skills.get_children():
		if child.name.begins_with("Skills"):
			continue
		elif child.name.begins_with("Active"):
			child.button_pressed = true
			continue
		child.button_pressed = false

	for child in $Skills.get_children():
		if child.name.begins_with("Active"):
			child.show()
			continue
		child.hide()

func _on_passive_pressed() -> void: # passive skills
	$Skills.show()
	$Featured.hide()
	for child in $ScrollContainer/VBoxContainer/Skills.get_children():
		if child.name.begins_with("Skills"):
			continue
		elif child.name.begins_with("Passive"):
			child.button_pressed = true
			continue
		child.button_pressed = false

	for child in $Skills.get_children():
		if child.name.begins_with("Passive"):
			child.show()
			continue
		child.hide()

func _on_fist_pressed() -> void:
	$Weapons.show()
	$Featured.hide()
	for child in $ScrollContainer/VBoxContainer/Weapons.get_children():
		if child.name.begins_with("Weapons"):
			continue
		elif child.name.begins_with("Fist"):
			child.button_pressed = true
			continue
		child.button_pressed = false

	for child in $Weapons.get_children():
		if child.name.begins_with("Fist"):
			child.show()
			continue
		child.hide()

func _on_sword_pressed() -> void:
	$Weapons.show()
	$Featured.hide()
	for child in $ScrollContainer/VBoxContainer/Weapons.get_children():
		if child.name.begins_with("Weapons"):
			continue
		elif child.name.begins_with("Sword"):
			child.button_pressed = true
			continue
		child.button_pressed = false

	for child in $Weapons.get_children():
		if child.name.begins_with("Sword"):
			child.show()
			continue
		child.hide()

func _on_lance_pressed() -> void:
	$Weapons.show()
	$Featured.hide()
	for child in $ScrollContainer/VBoxContainer/Weapons.get_children():
		if child.name.begins_with("Weapons"):
			continue
		elif child.name.begins_with("Lance"):
			child.button_pressed = true
			continue
		child.button_pressed = false

	for child in $Weapons.get_children():
		if child.name.begins_with("Lance"):
			child.show()
			continue
		child.hide()

func _on_equip_top_pressed() -> void:
	$Equipment.show()
	$Featured.hide()
	for child in $ScrollContainer/VBoxContainer/Equipment.get_children():
		if child.name.begins_with("Equipment"):
			continue
		elif child.name.begins_with("EquipTop"):
			child.button_pressed = true
			continue
		child.button_pressed = false

	for child in $Weapons.get_children():
		if child.name.begins_with("Top"):
			child.show()
			continue
		child.hide()

func _on_equip_bottom_pressed() -> void:
	$Equipment.show()
	$Featured.hide()
	for child in $ScrollContainer/VBoxContainer/Equipment.get_children():
		if child.name.begins_with("Equipment"):
			continue
		elif child.name.begins_with("EquipBottom"):
			child.button_pressed = true
			continue
		child.button_pressed = false

	for child in $Weapons.get_children():
		if child.name.begins_with("Bottom"):
			child.show()
			continue
		child.hide()
