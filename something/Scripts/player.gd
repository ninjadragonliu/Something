extends CharacterBody2D


func attack_left():
	# call enemy take_damage function
	var enemies_left = get_tree().get_nodes_in_group("enemyleft")
	for enemy in enemies_left:
		enemy.take_damage(1)

func attack_right():
	var enemies_right = get_tree().get_first_node_in_group("enemyright")
	for enemy in enemies_right:
		enemy.take_damage(1)

func attack(body : Node2D):
	#if body.is_in_group("enemy"):
		#var enemy = body.get_node("enemy")
		#enemy.take_damage(1)
	body.take_damage(1)
