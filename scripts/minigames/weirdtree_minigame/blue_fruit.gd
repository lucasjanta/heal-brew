extends Area2D
@onready var sprite_2d: Sprite2D = $Sprite2D
var colors : Array = ["a4dddb", "4f8fba"]

func _ready() -> void:
	sprite_2d.modulate = Color(colors.pick_random())
