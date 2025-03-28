extends CharacterBody2D

@onready var player = get_tree().get_nodes_in_group("player")[0]
var health = 1
var speed = 1

func _process(delta: float) -> void:
	if player.position.x - position.x > 0:
		position.x += speed
		if position.x >= 279.0 and position.y == 150:
			position.y = 400.0
	elif player.position.x - position.x < 0:
		position.x -= speed
		if position.x <= 873.0 and position.y == 150:
			position.y = 400.0

func take_damage(damage : int):
	health -= damage
	if health == 0:
		queue_free()
	
