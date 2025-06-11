extends Control

func _ready() -> void:
	$Equipment/Weapon2.button_pressed = true
	$Equipment.show()
	$Skill.hide()
	$Customize.hide()
	$VBoxContainer/Equip.button_pressed = true
	$Skill/Active.button_pressed = true
	_ready_weapon_page()
	$Panel/Player.text = "Player: " + Global.player_name

func _process(delta: float) -> void:
	$Panel/HP.text = "HP: " + str(Global.health)
	$"Panel/Current SKill".text = "Current Skill: " + "N/A" # N/A is placeholder
	$"Panel/Current Equip/Equip 1".text = "Equip 1: " + "N/A" # N/A is placeholder
	$"Panel/Current Equip/Equip 2".text = "Equip 2: " + "N/A" # N/A is placeholder
 
func _ready_weapon_page():
	var weapon_grid = $Equipment/Weapon/ScrollContainer/GridContainer
	
	for child in weapon_grid.get_children():
		weapon_grid.remove_child(child)
		child.queue_free()
		
	for i in range(3):
		for weapon in Global.saving_list[i]:
			var button = TextureButton.new()
			# weapon_name => weapon[0]
			var icon_path = "res://Assets/testing.png" # testing use code
			#var icon_path = "res://Assets/"+weapon[0]+".png"
			
			if ResourceLoader.exists(icon_path):
				button.texture_normal = load(icon_path)
			else:
				print("Icon: " +weapon[0]+ " not found man, try check the asset")
			
			button.ignore_texture_size = true
			button.stretch_mode = 0
			button.custom_minimum_size = Vector2(100,100)
			
			button.connect("pressed", _on_weapon_icon_pressed.bind(weapon[0]))
			weapon_grid.add_child(button)

func _ready_armor_page():
	var armor_grid = $Equipment/Armor/ScrollContainer/GridContainer
	
	for child in armor_grid.get_children():
		armor_grid.remove_child(child)
		child.queue_free()
	
	for armor_name in Global.player_armor_list:
		var button = TextureButton.new()
		
		var icon_path = "res://Assets/"+armor_name+".png"
		
		if ResourceLoader.exists(icon_path):
			button.texture_normal = load(icon_path)
		else:
			print("Icon: " +armor_name+ " not found man, try check the asset")
		
		button.ignore_texture_size = true
		button.stretch_mode = 0
		button.custom_minimum_size = Vector2(100,100)
		
		button.connect("pressed", _on_armor_icon_pressed.bind(armor_name))
		
		armor_grid.add_child(button)

func _ready_placeholder_page():
	var placeholder_grid = $Equipment/Placeholder/ScrollContainer/GridContainer
	
	for child in placeholder_grid.get_children():
		placeholder_grid.remove_child(child)
		child.queue_free()
	
	for placeholder_name in Global.player_placeholder_list:
		var button = TextureButton.new()
		
		var icon_path = "res://Assets/"+placeholder_name+".png"
		
		if ResourceLoader.exists(icon_path):
			button.texture_normal = load(icon_path)
		else:
			print("Icon: " +placeholder_name+ " not found man, try check the asset")
		
		button.ignore_texture_size = true
		button.stretch_mode = 0
		button.custom_minimum_size = Vector2(100,100)
		
		button.connect("pressed", _on_armor_icon_pressed.bind(placeholder_name))
		
		placeholder_grid.add_child(button)

func _ready_active_page():
	var active_skill_grid = $ActiveSkills/ScrollContainer/GridContainer
	
	for child in active_skill_grid.get_children():
		active_skill_grid.remove_child(child)
		child.queue_free()
	
	for skill_name in Global.player_active_skill_list:
		var button = TextureButton.new()
		
		var icon_path = "res://Assets/1421 - Icon.png"#"res://Assets/"+skill_name+".png"
		
		if ResourceLoader.exists(icon_path):
			button.texture_normal = load(icon_path)
		else:
			print("Icon: " +skill_name+ " not found man, try check the asset")
		
		button.ignore_texture_size = true
		button.stretch_mode = 0
		button.custom_minimum_size = Vector2(100,100)
		
		button.connect("pressed", _on_active_skill_icon_pressed.bind(skill_name))
		
		active_skill_grid.add_child(button)

func _ready_passive_page():
	var passive_skill_grid = $PassiveSkills/ScrollContainer/GridContainer
	
	for child in passive_skill_grid.get_children():
		passive_skill_grid.remove_child(child)
		child.queue_free()
	
	for skill_name in Global.player_passive_skill_list:
		var button = TextureButton.new()
		
		var icon_path = "res://Assets/1420 - Icon.png"#"res://Assets/"+skill_name+".png"
		
		if ResourceLoader.exists(icon_path):
			button.texture_normal = load(icon_path)
		else:
			print("Icon: " +skill_name+ " not found man, try check the asset")
		
		button.ignore_texture_size = true
		button.stretch_mode = 0
		button.custom_minimum_size = Vector2(100,100)
		
		button.connect("pressed", _on_passive_skill_icon_pressed.bind(skill_name))
		
		passive_skill_grid.add_child(button)
func _on_weapon_icon_pressed(weapon_name):
	print("Description screen not built for "+weapon_name)

func _on_armor_icon_pressed(armor_name):
	print("Description screen not built for "+armor_name)

func _on_placeholder_icon_pressed(placeholder_name):
	print("Description screen not built for "+placeholder_name)

func _on_active_skill_icon_pressed(skill_name):
	if skill_name == "Empty":
		
			
		Global.player_current_active = "Empty"
	print("Guess what is not done? yeah, active skill replacemen: " + skill_name)

func _on_passive_skill_icon_pressed(skill_name):
	print("Guess what is not done? yeah, active skill replacemen: " + skill_name)
	
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
	$Skill/Active2.show()
	$Skill/Passive2.hide()
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
	$Equipment/Weapon2.button_pressed = true
	$Equipment/Armor2.button_pressed = false
	$Equipment/Placeholder2.button_pressed = false
	_ready_weapon_page()

func _on_armor_2_pressed() -> void:
	$Equipment/Weapon.hide()
	$Equipment/Armor.show()
	$Equipment/Placeholder.hide()
	$Equipment/Weapon2.button_pressed = false
	$Equipment/Armor2.button_pressed = true
	$Equipment/Placeholder2.button_pressed = false
	_ready_armor_page()

func _on_placeholder_2_pressed() -> void:
	$Equipment/Weapon.hide()
	$Equipment/Armor.hide()
	$Equipment/Placeholder.show()
	$Equipment/Weapon2.button_pressed = false
	$Equipment/Armor2.button_pressed = false
	$Equipment/Placeholder2.button_pressed = true
	_ready_placeholder_page()

func _on_active_pressed() -> void:
	$Skill/Active.button_pressed = true
	$Skill/Passive.button_pressed = false
	$Skill/Active2.show()
	$Skill/Passive2.hide()

func _on_passive_pressed() -> void:
	$Skill/Active.button_pressed = false
	$Skill/Passive.button_pressed = true
	$Skill/Active2.hide()
	$Skill/Passive2.show()

func _on_passive_skill_1_pressed() -> void:
	_ready_passive_page()
	$PassiveSkills.show()

func _on_passive_skill_2_pressed() -> void:
	_ready_passive_page()
	$PassiveSkills.show()

func _on_passive_skills_close_requested() -> void:
	$PassiveSkills.hide()

func _on_active_skills_close_requested() -> void:
	$ActiveSkills.hide()

func _on_active_skill_1_pressed() -> void:
	_ready_active_page()
	$ActiveSkills.show()
