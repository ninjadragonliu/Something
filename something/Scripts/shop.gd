extends Control


func _on_back_pressed() -> void:
	Global.save_game_data()
	get_tree().change_scene_to_file("res://Scenes/main_page.tscn")


func _on_costume_pressed() -> void:
	$Costume.show()
	$Skills.hide()


func _on_skills_pressed() -> void:
	$Costume.hide()
	$Skills.show()
