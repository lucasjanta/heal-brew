extends Node2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var side : String
var cd : float = 0.0
var attacking := false

func change_side():
	side = ["left", "right"].pick_random()
	animated_sprite_2d.play(side)
	cd = randf_range(1.0, 4.0)
	
func _process(delta: float) -> void:
	
	if !attacking:	
		if cd > 0.0:
			cd -= delta
		else:
			cd = 0.0
			change_side()

func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "up":
		cd = 2.0


func attack():
	attacking = true
	animated_sprite_2d.play("attack")
	animation_player.play("attack")
