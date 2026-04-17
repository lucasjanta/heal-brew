extends Node2D

@onready var left_fruits: Node2D = $fruitSpawnPoints/leftFruits
@onready var right_fruits: Node2D = $fruitSpawnPoints/rightFruits

@onready var slingshot: Node2D = $slingshot
@onready var rock_pos: Marker2D = $slingshot/rock_pos
@onready var animated_sprite_2d: AnimatedSprite2D = $slingshot/AnimatedSprite2D
const ROCK = preload("uid://bakmiu7ucturt")
const BLUE_FRUIT = preload("uid://btmru1jkvdkrm")

func _ready() -> void:
	spawn_fruits()

func _process(delta: float) -> void:
	slingshot.global_position.x = get_global_mouse_position().x

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		animated_sprite_2d.play("pull")
	if event.is_action_released("click"):
		animated_sprite_2d.play("throw")


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "throw":
		throw()

func throw():
	var new_rock = ROCK.instantiate()
	add_child(new_rock)
	new_rock.global_position = rock_pos.global_position

func spawn_fruits():
	for child in left_fruits.get_children():
		spawn_fruit("left", child.global_position)
	for child in right_fruits.get_children():
		spawn_fruit("right", child.global_position)
		
func spawn_fruit(side : String, pos : Vector2):
	var new_fruit = BLUE_FRUIT.instantiate()
	add_child(new_fruit)
	new_fruit.global_position = pos
	new_fruit.add_to_group(side)
