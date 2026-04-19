extends Control

func _on_button_pressed() -> void:
	Global.scene_manager.change_gui_scene("res://scenes/reset/blank_gui.tscn", true, false)
