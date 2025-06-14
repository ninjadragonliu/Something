extends VBoxContainer
var current_tab

func _ready() -> void:
	pass
		
func boughtFromStoreWeapon(param):
	for key in param:
		match key:
			"currency":
				for key1 in param[key]:
					match key1:
						"coins_110":
							Global.coins += 110
			"sword":
				for key1 in param[key]:
					match key1:
						"broadsword":
							Global.player_weapon_list.append("broadsword")
							param[key][key1] = 0

	print("Bought from shop")

func boughtFromStoreEquipment():
	pass
	
func boughtFromStoreSkill():
	pass
	
func boughtFromStoreCostume():
	pass
	
func boughtFromStoreFeature():
	pass
