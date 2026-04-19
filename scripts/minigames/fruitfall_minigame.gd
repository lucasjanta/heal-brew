extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var fruit_spawn_places: Node2D = $FruitSpawnPlaces
@onready var witch: CharacterBody2D = $fruitgame_witch
@onready var kick_label: Label = $KickLabel



const RED_FRUIT = preload("uid://d3qh3xmsxot87")
var fruits_in_tree : Array = []
var red_fruits : int = 0

var can_kick := false

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
		
func shake_tree():
	witch.kick()
	get_fruits()
	animation_player.play("shake")
	for fruit in fruits_in_tree:
		fruit.shake()


func _on_shake_area_body_entered(body: Node2D) -> void:
	if body is FruitMinigamePlayer:
		can_kick = true
		kick_label.visible = true
		
		
func _on_shake_area_body_exited(body: Node2D) -> void:
	if body is FruitMinigamePlayer:
		can_kick = false
		kick_label.visible = false
		
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and can_kick:
		shake_tree()
		
func check_minigame_end():
	if get_tree().get_nodes_in_group("fruits").size() == 0:
		await get_tree().create_timer(1.0).timeout
		Global.added_red_fruits = red_fruits
		Global.getting_back = true
		Global.scene_manager.change_2D_scene("res://scenes/forest.tscn", true, false)
	
func pause():
	get_tree().paused = true


#
#func _on_back_button_pressed() -> void:
	#Global.red_fruits += red_fruits
