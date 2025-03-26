extends CharacterBody2D


func attack():
	# call enemy take_damage function
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		enemy.take_damage(1)
