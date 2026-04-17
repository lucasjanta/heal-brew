extends Node2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var side : String
var cd : float = 0.0
var looking = false 

func change_side():
	side = ["left", "right"].pick_random()
	animated_sprite_2d.play(side)
	cd = randf_range(1.0, 4.0)
	
func _process(delta: float) -> void:
	if looking and cd == 0.0:
		looking = false
		animated_sprite_2d.play("up")
	
		
	if cd > 0.0:
		cd -= delta
	else:
		cd = 0.0
		looking = true
		change_side()

func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "up":
		cd = 2.0
		looking = false
