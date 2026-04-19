extends Node2D
@onready var fruit_spawn_points: Node2D = $FruitSpawnPoints
@onready var scissors: Node2D = $scissors
@onready var animation_player: AnimationPlayer = $scissors/AnimationPlayer
@onready var scissors_cd: TextureProgressBar = $scissors/ScissorsCD

const ORANGE_FRUIT = preload("uid://h0gsxojqpun2")
var orange_fruits : int = 0
var on_cd := false
var game_end := false

func _ready() -> void:
	spawn_fruits()
	print("gooo")

# Called when the node enters the scene tree for the first time.
func spawn_fruits():
	for child in fruit_spawn_points.get_children():
		var new_fruit = ORANGE_FRUIT.instantiate()
		new_fruit.global_position = child.global_position
		add_child(new_fruit)
		new_fruit.add_to_group("fruits")

func _process(delta: float) -> void:
	if !game_end:
		scissors.global_position = get_global_mouse_position()
		if scissors_cd.value < 100.0:
			scissors_cd.value += delta * 75
		else:
			scissors_cd.value = 100.0
	else:
		scissors.global_position.y += delta * 100
		scissors.global_rotation_degrees += delta * 100
		
		if scissors.global_position.y > 200:
			await get_tree().create_timer(1.0).timeout
			Global.added_orange_fruits = orange_fruits
			Global.getting_back = true
			Global.scene_manager.change_2D_scene("res://scenes/forest.tscn", true, false)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") or event.is_action_pressed("click"):
		if scissors_cd.value == 100.0:
			animation_player.play("cut")
			scissors_cd.value = 0
			for enemy in get_tree().get_nodes_in_group("enemies"):
				enemy.attack()

func check_empty_fruits():
	if get_tree().get_nodes_in_group("fruits").size() == 1:
		await get_tree().create_timer(1.0).timeout
		Global.added_orange_fruits = orange_fruits
		Global.getting_back = true
		Global.scene_manager.change_2D_scene("res://scenes/forest.tscn", true, false)

#func pause():
	#get_tree().paused = true
#
#
#func _on_back_button_pressed() -> void:
	#Global.orange_fruits += orange_fruits
