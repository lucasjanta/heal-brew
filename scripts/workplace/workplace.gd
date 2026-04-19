extends Node2D
var day1 : Array = [0, 1, 3]
var day2 : Array = [1, 0, 2]
var day3 : Array = [3, 4, 0]
var day4 : Array = [4, 2, 4]
var day5 : Array = [3, 0, 5]



const CLIENT = preload("uid://dvmyuwltart7")

func _ready() -> void:
	await get_tree().create_timer(2.0).timeout
	new_client()

func new_client():
	var new_client = CLIENT.instantiate()
	var client_chosen = day1.pick_random()
	day1.erase(client_chosen)
	new_client.client = client_chosen
	new_client.global_position.x = randf_range(50.0, 270.0)
	add_child(new_client)
