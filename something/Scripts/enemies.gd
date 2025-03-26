extends Node

var enemies : Array

func _ready() -> void:
	enemies = get_tree().get_nodes_in_group("enemy")
