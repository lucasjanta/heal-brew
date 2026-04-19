extends PanelContainer
@onready var music_slider: HSlider = $MarginContainer/VBoxContainer/HBoxContainer/musicSlider
@onready var sfx_slider: HSlider = $MarginContainer/VBoxContainer/HBoxContainer3/sfxSlider


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	music_slider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music")))
	sfx_slider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))


func _on_music_slider_value_changed(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), db)

func _on_sfx_slider_value_changed(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), db)
