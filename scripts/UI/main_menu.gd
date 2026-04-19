extends Control



func _on_start_button_pressed() -> void:
	Global.scene_manager.change_2D_scene("res://scenes/forest.tscn", true, false)
	if Global.forest_first_time:
		Global.scene_manager.change_gui_scene("res://scenes/UI/day_tutorial.tscn", true, false)


func _on_quit_button_pressed() -> void:
	get_tree().quit()
