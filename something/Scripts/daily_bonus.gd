extends Control

signal daily_login_finished

func _on_back_pressed() -> void:
	emit_signal("daily_login_finished")
	queue_free()
