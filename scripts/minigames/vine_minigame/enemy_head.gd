extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var min_spawn_range : Vector2
@export var max_spawn_range : Vector2

var mouse_pos : Vector2
var attacking := false
var dir : Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if attacking:
		translate(dir * delta * 200)
		if global_position.x < -40 or global_position.x > 360 or global_position.y < -40 or global_position.y > 220:
			attacking = false
		#position.x += dir * delta * 80

func attack():
	AudioManager.play_monster_attack()
	mouse_pos = get_global_mouse_position()
	global_position = Vector2(randf_range(min_spawn_range.x, max_spawn_range.x), randf_range(min_spawn_range.y, max_spawn_range.y))
	if mouse_pos.x > 0 and mouse_pos.x < 320.0:
		look_at(mouse_pos)
		if mouse_pos.x < global_position.x:
			animated_sprite_2d.flip_h = true
		elif mouse_pos.x > global_position.x:
			animated_sprite_2d.flip_h = false
	attacking = true
	dir = global_position.direction_to(mouse_pos)
	


func _on_area_entered(area: Area2D) -> void:
	if area.name == "scissor_area":
		get_parent().game_end = true
