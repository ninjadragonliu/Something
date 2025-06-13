extends VBoxContainer
var current_tab

func _on_buy_pressed() -> void:
	var button_text = $Buy.text.split(" ")
	var cost = button_text[1].to_int()
	if Global.coins < cost:
		print("Not enough coins")
	else:
		boughtFromStore(Global.shop_equipment)
		boughtFromStore(Global.shop_weapons)
		Global.coins -= cost
		$Buy.disabled = true
		$Buy.text = "Bought"
		
func boughtFromStore(param):
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
	#print(param)
	#print(param.keys())
	#match param.keys():
		#"currency":
			#print(param["currency"].values())
			
	print("Bought from shop")
