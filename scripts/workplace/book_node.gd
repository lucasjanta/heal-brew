extends Node2D

var page : int = 1
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _on_next_page_pressed() -> void:
	if page < 4:
		page += 1
	else:
		page = 1
	check_page()


func _on_previous_page_pressed() -> void:
	if page > 1:
		page -= 1
	else:
		page = 4
	check_page()

func check_page():
	match page:
		1:
			animated_sprite_2d.play("page1")
		2:
			animated_sprite_2d.play("page2")
		3:
			animated_sprite_2d.play("page3")
		4:
			animated_sprite_2d.play("page4")
