extends Node

var max_health = 1
var health = max_health
var player_id
var player_name = "John Doe"
var level = 0
var mapNumber = 1
var mapConstant = 10 * mapNumber
var growthFactor = 0.5
var amplitude = 5 * min(mapNumber,100)

func reset_health():
	Global.health = Global.max_health
