extends Node2D

@onready var cursor: Node2D = $cursor
@onready var water_sprite: Sprite2D = $cauldron/water_container/waterSprite

var fruit_under : String = "none"
var fruit_on_hold : String = "none"
var over_cauldron := false
var water_in := false
var fruits_on_cauldron : Array = []

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN


func _on_red_fruit_crate_mouse_entered() -> void:
	fruit_under = "red"
	print(fruit_under)

func _on_orange_fruit_crate_mouse_entered() -> void:
	fruit_under = "orange"
	print(fruit_under)


func _on_blue_fruit_crate_mouse_entered() -> void:
	fruit_under = "blue"
	print(fruit_under)

func _on_red_fruit_crate_mouse_exited() -> void:
	fruit_under = "none"
	print(fruit_under)

func _on_orange_fruit_crate_mouse_exited() -> void:
	fruit_under = "none"
	print(fruit_under)

func _on_blue_fruit_crate_mouse_exited() -> void:
	fruit_under = "none"
	print(fruit_under)
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		if fruit_under != "none":
			cursor.grab()
			fruit_on_hold = fruit_under
			cursor.fruit_sprite.visible = true
			cursor.fruit_sprite.animation = fruit_under
		else:
			cursor.fruit_sprite.visible = false
			fruit_on_hold = "none"
	if event.is_action_released("click"):
		cursor.fruit_sprite.animation = "none"
		cursor.fruit_sprite.visible = false
		cursor.normal()
		
		if over_cauldron and fruit_on_hold != "none" and fruits_on_cauldron.size() < 3:
			fruits_on_cauldron.append(fruit_on_hold)
			update_fruits_on()
			
		


func _on_cauldron_mouth_mouse_entered() -> void:
	over_cauldron = true

func _on_cauldron_mouth_mouse_exited() -> void:
	over_cauldron = false

func update_fruits_on():
	var i = 1
	for fruit in fruits_on_cauldron:
		match i:
			1:
				$cauldron/fruit_container/fruit1.texture = load("res://assets/png/%s_fruit.png" % fruit)
			2:
				$cauldron/fruit_container/fruit2.texture = load("res://assets/png/%s_fruit.png" % fruit)
			3:
				$cauldron/fruit_container/fruit3.texture = load("res://assets/png/%s_fruit.png" % fruit)
		i += 1

func update_water_on():
	water_sprite.visible = water_in
