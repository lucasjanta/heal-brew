extends Control

@onready var options_container: VBoxContainer = $PanelContainer/MarginContainer/optionsContainer
@onready var menu_container: VBoxContainer = $PanelContainer/MarginContainer/VBoxContainer
@onready var music_slider: HSlider = $PanelContainer/MarginContainer/optionsContainer/VBoxContainer/HBoxContainer/musicSlider
@onready var sfx_slider: HSlider = $PanelContainer/MarginContainer/optionsContainer/VBoxContainer/HBoxContainer2/sfxSlider

func _ready() -> void:
	music_slider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music")))
	sfx_slider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))
	AudioManager.play_main_menu_music()

func _on_start_button_pressed() -> void:
	Global.scene_manager.change_2D_scene("res://scenes/forest.tscn", true, false)
	if Global.forest_first_time:
		Global.scene_manager.change_gui_scene("res://scenes/UI/day_tutorial.tscn", true, false)



func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_options_button_pressed() -> void:
	options_container.visible = true
	menu_container.visible = false


func _on_back_button_pressed() -> void:
	options_container.visible = false
	menu_container.visible = true


func _on_music_slider_value_changed(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), db)


func _on_sfx_slider_value_changed(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), db)
