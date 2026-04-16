extends Node2D
const BUSH = preload("uid://bn161vq62101c")
const TREE = preload("uid://bk66b5ygqhetv")
const VINE = preload("uid://jktahw8lt26")

var options : Array = [BUSH, TREE, VINE]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_plants()
	
func spawn_plants():
	for child in get_children():
		var new_plant = options.pick_random().instantiate()
		add_child(new_plant)
		new_plant.global_position = child.global_position
