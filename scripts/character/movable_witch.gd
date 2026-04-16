extends CharacterBody2D
class_name Player
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


@export var speed := 150.0
const JUMP_VELOCITY = -400.0
var dir := Vector2(0.0, 0.0) 

func _physics_process(delta: float) -> void:

	dir.x = Input.get_axis("left", "right")
	dir.y = Input.get_axis("up", "down")
	
	if dir != Vector2.ZERO:
		animation_player.play("walk")
	else:
		animation_player.stop()
	
	if dir.y < 0:
		animated_sprite_2d.animation = "back"
	elif dir.y > 0:
		animated_sprite_2d.animation = "front"
	
	velocity = dir.normalized() * speed
	
	move_and_slide()
