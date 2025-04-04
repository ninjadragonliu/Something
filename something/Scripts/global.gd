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
var cleared_levels = []
var levels_in_map = 11
var tutorial_cleared = false
var tutorial_levels = 5
var cleared_tutorial_levels = []
var tutorial_counter = 1

func reset_health():
	Global.health = Global.max_health

func unlock_next_level():
	if level not in cleared_levels:
		cleared_levels.append(level)
		
func unlock_next_tutorial_level():
	if tutorial_counter not in cleared_tutorial_levels:
		cleared_tutorial_levels.append(tutorial_counter)
