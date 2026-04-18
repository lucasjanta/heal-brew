extends Node2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var fruit_sprite: AnimatedSprite2D = $fruitSprite

func _process(delta: float) -> void:
	global_position = get_global_mouse_position()

func grab():
	animated_sprite_2d.play("claw_hand")
	
func hover():
	animated_sprite_2d.play("click_hand")
	
func normal():
	animated_sprite_2d.play("open_hand")
