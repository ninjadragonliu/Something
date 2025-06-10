extends VBoxContainer

signal currency_changed

func _on_buy_pressed() -> void:
	var button_text = $Buy.text.split(" ")
	var cost = button_text[1].to_int()
	if Global.coins < cost:
		print("Not enough coins")
	#if coins < 100:
		#print("Not enough coins")
	else:
		print("Item bought")
		Global.coins -= cost
		$Buy.disabled = true
		$Buy.text = "Bought"
		emit_signal("currency_changed")
