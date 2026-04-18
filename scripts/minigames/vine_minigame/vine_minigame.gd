extends Node2D
@onready var fruit_spawn_points: Node2D = $FruitSpawnPoints
@onready var scissors: Node2D = $scissors
@onready var animation_player: AnimationPlayer = $scissors/AnimationPlayer
@onready var scissors_cd: TextureProgressBar = $scissors/ScissorsCD
@onready var fruits_number: Label = $CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/FruitsNumber

const ORANGE_FRUIT = preload("uid://h0gsxojqpun2")
var orange_fruits : int = 0
var on_cd := false
var game_end := false

func _ready() -> void:
	spawn_fruits()

# Called when the node enters the scene tree for the first time.
func spawn_fruits():
	for child in fruit_spawn_points.get_children():
		var new_fruit = ORANGE_FRUIT.instantiate()
		new_fruit.global_position = child.global_position
		add_child(new_fruit)

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
			fruits_number.text = "Orange Fruits: %s" % str(orange_fruits)
			$CanvasLayer/AnimationPlayer.play("in")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") or event.is_action_pressed("click"):
		if scissors_cd.value == 100.0:
			animation_player.play("cut")
			scissors_cd.value = 0
			for enemy in get_tree().get_nodes_in_group("enemies"):
				enemy.attack()

func pause():
	get_tree().paused = true
