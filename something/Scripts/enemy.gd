extends CharacterBody2D

var health = 1

func _process(delta: float) -> void:
	position.x += 1

func take_damage(damage : int):
	health -= 1
	if health == 0:
		queue_free()
	
