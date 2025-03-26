extends CharacterBody2D

func attack(body : Node2D):
	#if body.is_in_group("enemy"):
		#var enemy = body.get_node("enemy")
		#enemy.take_damage(1)
	body.take_damage(1)

func take_damage(damage : int):
	pass
