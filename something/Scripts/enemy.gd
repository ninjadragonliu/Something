extends CharacterBody2D

@onready var player = get_tree().get_nodes_in_group("player")[0]
var health = 1
var speed = 1

func _process(delta: float) -> void:
	if player.position.x - position.x > 0:
		position.x += speed
	elif player.position.x - position.x < 0:
		position.x -= speed

func take_damage(damage : int):
	health -= damage
	if health == 0:
		queue_free()
	
