extends Control

@onready var player = get_tree().get_nodes_in_group("player")[0]

func _on_left_pressed() -> void:
	# if enemy comes into line
		# attack 1 hit ko
	player.attack()
	


func _on_right_pressed() -> void:
	# if enemy comes into line
		# attack 1 hit ko
	pass # Replace with function body.
	
	
	
