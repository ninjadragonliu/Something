extends Control


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_page.tscn")


func _on_costume_pressed() -> void:
	$Costume.show()
	$Skills.show()


func _on_skills_pressed() -> void:
	$Costume.hide()
	$Skills.show()
