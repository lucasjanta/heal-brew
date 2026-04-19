extends Node2D

@onready var treated_number: Label = $CanvasLayer/PanelContainer2/MarginContainer/HBoxContainer/HBoxContainer/TreatedNumber
@onready var mistakes_number: Label = $CanvasLayer/PanelContainer2/MarginContainer/HBoxContainer/HBoxContainer2/MistakesNumber
var clients : Array

const CLIENT = preload("uid://dvmyuwltart7")

func _ready() -> void:
	check_day()
	await get_tree().create_timer(2.0).timeout
	new_client()

func new_client():
	if clients.size() > 0:
		var new_client = CLIENT.instantiate()
		var client_chosen = clients.pick_random()
		clients.erase(client_chosen)
		new_client.client = client_chosen
		new_client.global_position.x = randf_range(50.0, 270.0)
		add_child(new_client)
	else:
		if Global.mistakes > 2:
				Global.scene_manager.change_gui_scene("res://scenes/UI/end_game.tscn", true, false)
				Global.scene_manager.change_2D_scene("res://scenes/reset/blank_2d.tscn", true, false)
				get_tree().paused = true
				return
		Global.day += 1
		Global.scene_manager.change_gui_scene("res://scenes/UI/day_transition.tscn", true, false)

func update_ui():
	treated_number.text = str(Global.people_treated)
	mistakes_number.text = str(Global.mistakes)
	if Global.mistakes == 3:
		Global.scene_manager.change_gui_scene("res://scenes/UI/end_game.tscn", true, false)
		get_tree().paused = true


func _on_lab_button_pressed() -> void:
	print("test")
	Global.scene_manager.change_2D_scene("res://scenes/cart/lab.tscn", false, false)

func check_day():
	match Global.day:
		1:
			clients = [0,1,2]
		2:
			clients = [0, 1, 3, 4]
		3:
			clients = [1, 2, 4, 5]
		4:
			clients = [2, 3, 4, 5, 5]
		5: 
			clients = [6]
			
