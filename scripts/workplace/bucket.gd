extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var mouse_in := false
var grabbing := false
var on_cauldron := false



func _on_mouse_entered() -> void:
	mouse_in = true


func _on_mouse_exited() -> void:
	mouse_in = false
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and mouse_in:
		grabbing = true
	if event.is_action_released("click") and grabbing:
		if on_cauldron and animated_sprite_2d.animation == "full":
			print("add to cauldron")
		grabbing = false
		animated_sprite_2d.play("empty")
		global_position = Vector2(233.0, 55.0)
		
func _process(delta: float) -> void:
	if grabbing:
		global_position = get_global_mouse_position()


func _on_area_entered(area: Area2D) -> void:
	if area.name == "cauldron_mouth":
		on_cauldron = true
		
	if area.name == "tap" and animated_sprite_2d.animation != "full":
		$"../tap/AnimatedSprite2D".play("loop")
		animated_sprite_2d.play("filling")
		


func _on_area_exited(area: Area2D) -> void:
	if area.name == "cauldron_mouth":
		on_cauldron = false
	if area.name == "tap":
		$"../tap/AnimatedSprite2D".play("close")
		if animated_sprite_2d.animation != "full":
			animated_sprite_2d.play("empty")


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "filling":
		animated_sprite_2d.play("full")
