extends Control
signal tab_changed(tab_name: String)

@onready var store_item_scene = preload("res://Scenes/store_item.tscn")

func _ready() -> void:
	$ScrollContainer/VBoxContainer/Featured.button_pressed = true
	_on_featured_pressed()

func _process(delta: float) -> void:
	$VBoxContainer2/Coins/Label.text = str(Global.coins)
	$VBoxContainer2/Diamonds/Label.text =  str(Global.diamonds)

func _on_back_pressed() -> void:
	Global.save_game_data()
	get_tree().change_scene_to_file("res://Scenes/main_page.tscn")

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
	_ready_shop_feature_page()
	$Featured.show()
	$Equipment.hide()
	$Weapons.hide()
	$Skills.hide()
	$Costume.hide()

func _ready_shop_feature_page():
	var shop_feature_grid = $Featured/ScrollContainer/GridContainer
	
	for child in shop_feature_grid.get_children():
		shop_feature_grid.remove_child(child)
		child.queue_free()
	
	for i in range(7):
		for item in Global.saving_list[i]:
			if item[7] == true:
				var itemSlot = store_item_scene.instantiate()
				# item_name => item[0]
				var textureRect_path = "res://Assets/testing.png" # testing use code
				#var icon_path = "res://Assets/"+item[0]+".png"
				
				if ResourceLoader.exists(textureRect_path):
					itemSlot.get_node("TextureRect").texture = load(textureRect_path)
					
					#.texture_normal = load(icon_path)
				else:
					print("Icon: " +item[0]+ " not found man, try check the asset")
				
				#var icon_path = "res://Assets/"+item[0]+".png"
				var icon_path = "res://Assets/stars.png"
				itemSlot.get_node("Buy").icon = load(icon_path)
				
				if item[7]:
					itemSlot.get_node("Buy").text = str(int(item[8]))
				elif item[6]:
					itemSlot.get_node("Buy").text = str(int(item[5]))
				
				#
				#button.ignore_texture_size = true
				#button.stretch_mode = 0
				#button.custom_minimum_size = Vector2(100,100)
				#
				#button.connect("pressed", _on_weapon_icon_pressed.bind(i, item[0]))
				#if weapon[3] == 1:
					#button.texture_disabled = load("res://Assets/testing_disabled.png")
					#button.disabled = true # Unfinished, change this so that it also dims the image so it shows it can't be pressed
				itemSlot.get_node("Buy").connect("pressed", _on_buy_pressed.bind(i, item))
				if item[2] == true:
					itemSlot.get_node("Buy").disabled = true
					itemSlot.get_node("Buy").text = "Bought"
				shop_feature_grid.add_child(itemSlot)

func _on_buy_pressed(i, item) -> void:
	var cost = 0
	
	if item[7]:
		cost = int(item[8])
	elif item[6]:
		cost = int(item[5])
	
	match(item[4]):
		"diamond":
			if Global.diamonds < cost:
				print("Not enough diamond")
				return
			else:
				Global.diamonds -= cost
		"coin":
			if Global.coins < cost:
				print("Not enough coins")
				return
			else:
				Global.coins -= cost
	
	for target in Global.saving_list[i]:
		if target == item:
			target[2] = true
	_ready_shop_feature_page()

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
