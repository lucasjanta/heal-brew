extends Control

var actual_screen := 1
@onready var screen_1: HBoxContainer = $PanelContainer/MarginContainer/VBoxContainer/screen1
@onready var screen_2: HBoxContainer = $PanelContainer/MarginContainer/VBoxContainer/screen2


func _on_button_2_pressed() -> void:
	if actual_screen == 1:
		actual_screen = 2
	else:
		actual_screen = 1
		
	change_visibility()


func _on_button_3_pressed() -> void:
	if actual_screen == 1:
		actual_screen = 2
	else:
		actual_screen = 1
		
	change_visibility()
		
func change_visibility():
	match actual_screen:
		1:
			screen_1.visible = true
			screen_2.visible = false
		2:
			screen_1.visible = false
			screen_2.visible = true


func _on_button_pressed() -> void:
	Global.scene_manager.change_gui_scene("res://scenes/reset/blank_gui.tscn", true, false)
