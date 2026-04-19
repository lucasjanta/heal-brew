extends Control
@onready var label: Label = $Label

func _ready() -> void:
	label.text = "Day %s" % str(Global.day)
	$AnimationPlayer.play("new_day")

func go_to_forest():
	Global.scene_manager.change_2D_scene("res://scenes/forest.tscn", true, false)

func end_transition():
	Global.scene_manager.change_gui_scene("res://scenes/reset/blank_gui.tscn", true, false)
