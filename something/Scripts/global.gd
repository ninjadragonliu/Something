extends Node

var positions  = [
	Vector2(1, 100),
	Vector2(1, 400),
	Vector2(1150, 100),
	Vector2(1150, 400)
]

#region New Code Region
var max_health = 9
var health = max_health
var player_id
var player_name = "John Doe"
var vip_status = false
var intro_text = "Introduce yourself"
var coins = 0
var diamonds = 0
#endregion

#region New Code Region
var level = 0
var mapNumber = 1
var cleared_levels: Array[int] = []
var levels_in_map = 11
#endregion

#region New Code Region
var tutorial_cleared = true
var tutorial_levels = 5
var cleared_tutorial_levels: Array[int] = []
var tutorial_counter = 1
#endregion

#region New Code Region
var mapConstant_Amount = 20 * mapNumber
var growthFactor_Amount = 2
var amplitude_Amount = 7 * min(mapNumber, 100)
#endregion

#region New Code Region
var mapConstant_Speed = 1.2 * mapNumber
var growthFactor_Speed = 0.03
var amplitude_Speed = 0.1 * mapNumber
var was_data_loaded = false
#endregion

var costumes = []
var skills = []

func _ready() -> void:
	player_id = generate_player_id()

func generate_player_id():
	var temp = ""
	for i in range(10):
		temp += str(randi_range(0, 9))
	return temp

func reset_health():
	Global.health = Global.max_health

func unlock_next_level():
	if level not in cleared_levels:
		cleared_levels.append(level)
		
func unlock_next_tutorial_level():
	if tutorial_counter not in cleared_tutorial_levels:
		cleared_tutorial_levels.append(tutorial_counter)

func save_game_data():
	var data = {
		"coins": coins,
		"level": level,
		"diamonds": diamonds,
		"player_id": player_id,
		"mapNumber": mapNumber,
		"player_name": player_name,
		"cleared_levels": cleared_levels,
		"tutorial_cleared": tutorial_cleared,
		"vip_status": vip_status,
		"intro_text": intro_text,
		"tutorial_counter": tutorial_counter,
		"cleared_tutorial_levels": cleared_tutorial_levels
	}
	SaveSystem.save_game(data)
	print("💾 Global data saved:", data)

func _notification(what):
	if what == NOTIFICATION_APPLICATION_FOCUS_OUT \
	or what == NOTIFICATION_WM_CLOSE_REQUEST \
	or what == NOTIFICATION_WM_GO_BACK_REQUEST:
		save_game_data()

func load_data():
	if was_data_loaded:
		print("🟡 Data already loaded, skipping.")
		return
	var data := SaveSystem.load_game()
	if data:
		player_name = data.get("player_name", "John Doe")
		player_id = data.get("player_id", "")
		coins = data.get("coins", 0)
		diamonds = data.get("diamonds", 0)
		level = data.get("level", 1)
		mapNumber = data.get("mapNumber", 1)
		vip_status = data.get("vip_status", false)
		var loaded_array = data.get("cleared_levels", [])
		cleared_levels = []  # Clear any existing data just in case
		for i in loaded_array:
			cleared_levels.append(int(i))  # Ensure each item is cast to int
		intro_text = data.get("intro_text", "Introduce yourself")
		tutorial_cleared = data.get("tutorial_cleared", false)
		tutorial_counter = data.get("tutorial_counter", 1)
		var loaded_array2 = data.get("cleared_tutorial_levels", [])
		cleared_tutorial_levels = []
		for i in loaded_array2:
			cleared_tutorial_levels.append(int(i))
		was_data_loaded = true
		print("✅ Global data loaded:", data)
