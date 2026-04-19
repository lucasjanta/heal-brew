extends Control

func _ready() -> void:
	get_tree().paused = true

func _on_button_pressed() -> void:
	get_tree().paused = false
	Global.scene_manager.change_gui_scene("res://scenes/reset/blank_gui.tscn", true, false)
