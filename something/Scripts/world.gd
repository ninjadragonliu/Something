extends Control

@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var enemies = $Enemies2

@export var clear_screen : PackedScene

var enemy_in_range_left
var enemy_in_range_right
var enemies_remaining
var level_cleared = false

func _ready() -> void:
	enemies_remaining = enemies.enemies_amount
	
	# Connect player's signal to decrease enemy count
	player.take_damaged.connect(_on_player_damaged)
	
	var timer = Timer.new()
	timer.wait_time = 2.0  # 每 2 秒生成一个敌人
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)

	timer.timeout.connect(enemies.spawn_enemy)
	
	
func _process(delta: float) -> void:
	$Health/Label.text = str(Global.health) + "/100"
	$EnemiesRemaining.text = "Enemies Remaining: " + str(enemies_remaining)
	
	if enemies_remaining == 0 and not level_cleared:
		clear_level()  # Call clear level only once
		level_cleared = true  # Set flag to prevent re-triggering
		

func _on_player_damaged():
	enemies_remaining -= 1  # Decrease enemy count when player is hit

func clear_level():
	if clear_screen:
		var popup = clear_screen.instantiate()
		get_tree().root.add_child(popup)
		
		popup.call_deferred("popup_centered") 
	
func _on_left_pressed() -> void:
	if enemy_in_range_left:
		player.attack(enemy_in_range_left)
		enemies_remaining -= 1


func _on_right_pressed() -> void:
	if enemy_in_range_right:
		player.attack(enemy_in_range_right)
		enemies_remaining -= 1


func _on_line_left_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemy_in_range_left = body

func _on_line_right_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemy_in_range_right = body
