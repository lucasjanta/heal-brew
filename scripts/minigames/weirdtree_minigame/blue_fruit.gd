extends Area2D
class_name BlueFruit
@onready var sprite_2d: Sprite2D = $Sprite2D
var colors : Array = ["a4dddb", "4f8fba"]
var side : String = ""
var falling := false

func _ready() -> void:
	sprite_2d.modulate = Color(colors.pick_random())


func _process(delta: float) -> void:
	if falling:
		position.y += delta * 100

func _on_area_entered(area: Area2D) -> void:
	if area.name == "rock":
		AudioManager.play_fruit_collect()
		falling = true
		get_parent().blue_fruits += 1
		get_parent().check_owl_sight(side)
