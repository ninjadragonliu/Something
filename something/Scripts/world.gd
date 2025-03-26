extends Control

@onready var player = get_tree().get_nodes_in_group("player")[0]

var enemy_in_range_left
var enemy_in_range_right

func _process(delta: float) -> void:
	$Health/Label.text = str(Global.health) + "/100"

func _on_left_pressed() -> void:
	# if enemy comes into line
		# attack 1 hit ko
	if enemy_in_range_left:
		#player.attack_left()
		player.attack(enemy_in_range_left)


func _on_right_pressed() -> void:
	# if enemy comes into line
		# attack 1 hit ko
	if enemy_in_range_right:
		#player.attack_right()
		player.attack(enemy_in_range_right)


func _on_line_left_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemy_in_range_left = body

func _on_line_right_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemy_in_range_right = body
