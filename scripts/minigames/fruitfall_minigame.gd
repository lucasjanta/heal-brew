extends Node2D

@onready var fruit_spawn_places: Node2D = $FruitSpawnPlaces
const RED_FRUIT = preload("uid://d3qh3xmsxot87")
var fruits_in_tree : Array = []

func _ready() -> void:
	spawn_fruits()

func spawn_fruits():
	for child in fruit_spawn_places.get_children():
		var new_fruit = RED_FRUIT.instantiate()
		new_fruit.global_position = child.global_position
		add_child(new_fruit)
	get_fruits()
	

func get_fruits():
	fruits_in_tree = get_tree().get_nodes_in_group("fruits")
	print(fruits_in_tree)
		
	
