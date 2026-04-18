extends Node2D

@onready var left_fruits: Node2D = $fruitSpawnPoints/leftFruits
@onready var right_fruits: Node2D = $fruitSpawnPoints/rightFruits

@onready var slingshot: Node2D = $slingshot
@onready var rock_pos: Marker2D = $slingshot/rock_pos
@onready var animated_sprite_2d: AnimatedSprite2D = $slingshot/AnimatedSprite2D
@onready var owl: Node2D = $owl
@onready var fruits_number: Label = $CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/FruitsNumber


const ROCK = preload("uid://bakmiu7ucturt")
const BLUE_FRUIT = preload("uid://btmru1jkvdkrm")
var blue_fruits : int = 0

func _ready() -> void:
	spawn_fruits()

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position().x
	if mouse_pos > 0 and mouse_pos < 320:
		slingshot.global_position.x = mouse_pos

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		animated_sprite_2d.play("pull")
	if event.is_action_released("click"):
		if animated_sprite_2d.frame == 3:
			animated_sprite_2d.play("throw")
		else:
			animated_sprite_2d.play("normal")


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
	new_fruit.side = side


func _on_delete_area_area_entered(area: Area2D) -> void:
	if area.name == "rock":
		area.queue_free()

func check_owl_sight(fruit_dir : String):
	if fruit_dir == owl.side:
		owl.attack()


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	fruits_number.text = "Blue Fruits: %s" % str(blue_fruits)
	$CanvasLayer/AnimationPlayer.play("in")

func pause():
	get_tree().paused = true


func _on_delete_fruit_area_area_entered(area: Area2D) -> void:
	if area is BlueFruit:
		area.queue_free()
		var fruits_remaining = get_tree().get_node_count_in_group("blue_fruits")
		print(fruits_remaining)
		
		
		if fruits_remaining == 1:
			fruits_number.text = "Blue Fruits: %s" % str(blue_fruits)
			$CanvasLayer/AnimationPlayer.play("in")
