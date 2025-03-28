extends CharacterBody2D

signal take_damaged

func attack(body : Node2D):
	#if body.is_in_group("enemy"):
		#var enemy = body.get_node("enemy")
		#enemy.take_damage(1)
	body.take_damage(1)

func take_damage(damage : int):
	Global.health -= damage
	if Global.health == 0:
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		take_damage(1)
		body.queue_free()
		take_damaged.emit()
