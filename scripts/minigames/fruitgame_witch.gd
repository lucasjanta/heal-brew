extends CharacterBody2D
class_name FruitMinigamePlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var speed := 200.0


func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true

	move_and_slide()

func kick():
	animated_sprite_2d.play("kick")

func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "kick":
		animated_sprite_2d.play("front")
