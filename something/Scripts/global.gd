extends Node

var max_health = 1
var health = max_health
var player_id
var player_name = "John Doe"

var level = 0
var mapNumber = 1
var cleared_levels = []
var levels_in_map = 11

var tutorial_cleared = false
var tutorial_levels = 5
var cleared_tutorial_levels = []
var tutorial_counter = 1

var mapConstant_Amount = 20 * mapNumber
var growthFactor_Amount = 2
var amplitude_Amount = 7 * min(mapNumber, 100)

var mapConstant_Speed = 1.2 * mapNumber
var growthFactor_Speed = 0.03
var amplitude_Speed = 0.1 * mapNumber

func reset_health():
	Global.health = Global.max_health

func unlock_next_level():
	if level not in cleared_levels:
		cleared_levels.append(level)
		
func unlock_next_tutorial_level():
	if tutorial_counter not in cleared_tutorial_levels:
		cleared_tutorial_levels.append(tutorial_counter)
