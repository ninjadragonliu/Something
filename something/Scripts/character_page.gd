extends Control

var passive_slot = 0

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
	$"Panel/Current Equip/Equip 1".text = "Weapon: " #+ "N/A" # N/A is placeholder
	$"Panel/Current Equip/Equip 2".text = "Top: " #+  Global.top_list[Global.player_current_equip[2]][0] # N/A is placeholder
	$"Panel/Current Equip/Equip 2".text = "Bottom: " #+ Global.bottom_list[Global.player_current_equip[3]][0] # N/A is placeholder
	
	$"Panel/Current SKill/Active".text = "Active: " + Global.active_skill_list[Global.player_current_equip[4]][0]
	$"Panel/Current SKill/Passive 1".text = "Passive 1: " + Global.passive_skill_list[Global.player_current_equip[5]][0]
	$"Panel/Current SKill/Passive 2".text = "Passive 2: " + Global.passive_skill_list[Global.player_current_equip[6]][0]
 
func _ready_weapon_page():
	var weapon_grid = $Equipment/Weapon/ScrollContainer/GridContainer
	
	for child in weapon_grid.get_children():
		weapon_grid.remove_child(child)
		child.queue_free()
	
	for i in range(3):
		for weapon in Global.saving_list[i]:
			#print(weapon)
			if(weapon[3] != 1):
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

func _ready_top_page():
	var armor_grid = $Equipment/Armor/ScrollContainer/GridContainer
	
	for child in armor_grid.get_children():
		armor_grid.remove_child(child)
		child.queue_free()
	
	for top in Global.top_list:
		var button = TextureButton.new()
		# top_name => top[0]
		var icon_path = "res://Assets/testing.png" # testing use code
		#var icon_path = "res://Assets/"+top[0]+".png"
		
		if ResourceLoader.exists(icon_path):
			button.texture_normal = load(icon_path)
		else:
			print("Icon: " +top[0]+ " not found man, try check the asset")
		
		button.ignore_texture_size = true
		button.stretch_mode = 0
		button.custom_minimum_size = Vector2(100,100)
		
		button.connect("pressed", _on_top_icon_pressed.bind(top[0]))
		
		armor_grid.add_child(button)

func _ready_bottom_page():
	var placeholder_grid = $Equipment/Placeholder/ScrollContainer/GridContainer
	
	for child in placeholder_grid.get_children():
		placeholder_grid.remove_child(child)
		child.queue_free()
	
	for bottom in Global.bottom_list:
		var button = TextureButton.new()
		# bottom_name => bottom[0]
		var icon_path = "res://Assets/testing.png" # testing use code
		#var icon_path = "res://Assets/"+bottom[0]+".png"
		
		if ResourceLoader.exists(icon_path):
			button.texture_normal = load(icon_path)
		else:
			print("Icon: " +bottom[0]+ " not found man, try check the asset")
		
		button.ignore_texture_size = true
		button.stretch_mode = 0
		button.custom_minimum_size = Vector2(100,100)
		
		button.connect("pressed", _on_bottom_icon_pressed.bind(bottom[0]))
		
		placeholder_grid.add_child(button)

func _ready_active_page():
	var active_skill_grid = $ActiveSkills/ScrollContainer/GridContainer
	
	for child in active_skill_grid.get_children():
		active_skill_grid.remove_child(child)
		child.queue_free()
	
	for skill in Global.active_skill_list:
		if skill[2] == true:
			var button = TextureButton.new()
			# skill_name => skill[0]
			var icon_path = "res://Assets/testing.png" # testing use code
			#var icon_path = "res://Assets/"+skill[0]+".png"
			
			if ResourceLoader.exists(icon_path):
				button.texture_normal = load(icon_path)
			else:
				print("Icon: " +skill[0]+ " not found man, try check the asset")
			
			button.ignore_texture_size = true
			button.stretch_mode = 0
			button.custom_minimum_size = Vector2(100,100)
			
			button.connect("pressed", _on_active_skill_icon_pressed.bind(skill[0]))
			if skill[3] == 1 and skill[0] != "Empty":
				button.disabled = true # Unfinished, change this so that it also dims the image so it shows it can't be pressed
			active_skill_grid.add_child(button)

func _ready_passive_page():
	passive_slot = 0
	var passive_skill_grid = $PassiveSkills/ScrollContainer/GridContainer
	
	for child in passive_skill_grid.get_children():
		passive_skill_grid.remove_child(child)
		child.queue_free()
	
	for skill in Global.passive_skill_list: 
		if skill[2] == true:
			var button = TextureButton.new()
			# skill_name => skill[0]
			var icon_path = "res://Assets/testing.png" # testing use code
			#var icon_path = "res://Assets/"+skill[0]+".png"
			
			if ResourceLoader.exists(icon_path):
				button.texture_normal = load(icon_path)
			else:
				print("Icon: " +skill[0]+ " not found man, try check the asset")
			
			button.ignore_texture_size = true
			button.stretch_mode = 0
			button.custom_minimum_size = Vector2(100,100)
			
			button.connect("pressed", _on_passive_skill_icon_pressed.bind(skill[0]))
			if skill[3] == 1 and skill[0] != "Empty":
				button.disabled = true # Unfinished, change this so that it also dims the image so it shows it can't be pressed
			passive_skill_grid.add_child(button)

func _on_weapon_icon_pressed(weapon_name):
	print("Description screen not built for "+weapon_name)

func _on_top_icon_pressed(top_name):
	print("Description screen not built for "+top_name)

func _on_bottom_icon_pressed(bottom_name):
	print("Description screen not built for "+bottom_name)

func _on_active_skill_icon_pressed(skill_name):
	var index = 0
	
	#unequip
	Global.active_skill_list[Global.player_current_equip[4]][3] = 0
	
	for skill in Global.active_skill_list:
		if skill[0] == skill_name:
			skill[3] = 1
			Global.player_current_equip[4] = index
			break
			
		index += 1# keep track of index
	_on_active_skills_close_requested()

func _on_passive_skill_icon_pressed(skill_name):
	#print(skill_name+" skillName\n")
	var index = 0
	var slot = passive_slot+4 #calculate correct slot user are switching
	
	#unequip
	if !(Global.player_current_equip[5] == 0 and Global.player_current_equip[6] == 0):
		Global.passive_skill_list[Global.player_current_equip[slot]][3] = 0
	#print(Global.passive_skill_list[Global.player_current_equip[slot]])
	
	for skill in Global.passive_skill_list:
		if skill[0] == skill_name:
			skill[3] = 1
			Global.player_current_equip[slot] = index
			#print(skill)
			break
		
		index += 1# keep track of index
	#print(Global.passive_skill_list[Global.player_current_equip[slot]][0])
	_on_passive_skills_close_requested()

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
	_ready_top_page()

func _on_placeholder_2_pressed() -> void:
	$Equipment/Weapon.hide()
	$Equipment/Armor.hide()
	$Equipment/Placeholder.show()
	$Equipment/Weapon2.button_pressed = false
	$Equipment/Armor2.button_pressed = false
	$Equipment/Placeholder2.button_pressed = true
	_ready_bottom_page()

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
	passive_slot = 1

func _on_passive_skill_2_pressed() -> void:
	_ready_passive_page()
	$PassiveSkills.show()
	passive_slot = 2

func _on_passive_skills_close_requested() -> void:
	$PassiveSkills.hide()

func _on_active_skills_close_requested() -> void:
	$ActiveSkills.hide()

func _on_active_skill_1_pressed() -> void:
	_ready_active_page()
	$ActiveSkills.show()
