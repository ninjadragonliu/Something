extends Node

var positions  = [
	Vector2(1, 100),
	Vector2(1, 385),
	Vector2(1150, 100),
	Vector2(1150, 385)
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
var last_login_date = ""
#endregion

#region
# [Item_Name, Item_Type	, Player_Owns, Equipped , Currency of Cost, Cost, Shop   , OnSalesShop  , Sales Price]
# [String	, String	, Boolean	 , Int		, String		  , Int	, Boolean, Boolean		, Int]

# run to assign types
func _readyLists():
	for weapon in weapon_list_fist:
		weapon[1] = "fist"
	for weapon in weapon_list_sword:
		weapon[1] = "sword"
	for weapon in weapon_list_lance:
		weapon[1] = "lance"
	for top in top_list:
		top[1] = "top"
	for bottom in bottom_list:
		bottom[1] = "bottom"
	for active in active_skill_list:
		active[1] = "active"
	for passive in passive_skill_list:
		passive[1] = "passive"
	
	# testing lists
	print(saving_list)

# How to make event reward => give out the item as finish reward of event, then make sure Shop and on SalesShop => false 
var weapon_list_fist = [
	["Bare Fist","", true],
	["Soldier Glove","", false]
]
 
var weapon_list_sword = [
	["Wooden Sword","", false],
	["Soldier Sword","", false]
]

var weapon_list_lance = [
	["Wooden Lance","", false],
	["Soldier Lance","", false]
]
 
var top_list = [
	["Skin Armor", "", false],
	["Leather Armor", "", false]
]

var bottom_list = [
	["Skin Pants", "", false],
	["Leather Pants", "", false]
]

var active_skill_list = [
	["Empty", "", true],
	["HP+3", "", false]
]

var passive_skill_list = [
	["Empty", "", true],
	["MaxHP+2", "", false]
]

var saving_list = [weapon_list_fist, weapon_list_sword, weapon_list_lance, top_list, bottom_list, active_skill_list, passive_skill_list]
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
# reference weapon list in 1st code region
#region New Code Region shoppable items
# value = 1 - not sold, 0 is sold, -1 - unlimited value
var shop_costumes = [] # 3 types
var shop_skills = [] # 2 types
var shop_featured = [] # too many types
var coin_object = objectCreation.objectCreation("coins_110", "currency", -1)
#var shop_equipment = [coin_object] # 2 types 
var shop_equipment = {
	"currency": {
		"coins_110" : -1
	}
}
		
# weapon, armor, placeholder this is for adding to player bag
# (item_name, classification) - key : value
#var shop_weapons = [] # 3 types
var shop_weapons = {
	"sword": {
		"broadsword": 1
	}
}
#endregion


	
func _ready() -> void:
	player_id = generate_player_id()
	_readyLists()

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
		"cleared_tutorial_levels": cleared_tutorial_levels,
		"last_login_date": last_login_date,
		"saving_list": saving_list
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
		var last_login_date = data.get("last_login_date", "")
		var loaded_saving_list = data.get("saving_list", [])
		for i in loaded_saving_list:
			saving_list.append(i)
		print("✅ Global data loaded:", data)
