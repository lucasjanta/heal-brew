extends Control


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _on_button_pressed() -> void:
	Global.day += 1
	Global.scene_manager.change_gui_scene("res://scenes/UI/day_transition.tscn", true, false)
