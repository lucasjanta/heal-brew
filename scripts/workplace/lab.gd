extends Node2D

@onready var cursor: Node2D = $cursor
var fruit_under : String = "none"



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
			cursor.fruit_sprite.visible = true
			cursor.fruit_sprite.animation = fruit_under
		else:
			cursor.fruit_sprite.visible = false
	if event.is_action_released("click"):
		cursor.normal()
		
