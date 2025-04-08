extends Popup

func _ready() -> void:
	
	$VBoxContainer/ID.text = "ID: " + Global.player_id
	
	if Global.vip_status:
		$VBoxContainer/TextureRect.show()

func _process(delta: float) -> void:
	$VBoxContainer/PlayerName.text = "Player Name: " + Global.player_name

func _on_back_pressed() -> void:
	get_tree().paused = false
	await get_tree().process_frame
	hide()


func _on_popup_confirmed() -> void:
	Global.player_name = $Name/LineEdit.text

func _on_texture_button_pressed() -> void:
	$Name.show()
	$Name/LineEdit.placeholder_text = "Enter new player name"
