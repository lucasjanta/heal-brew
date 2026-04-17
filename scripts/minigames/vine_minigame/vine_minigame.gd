extends Node2D
@onready var fruit_spawn_points: Node2D = $FruitSpawnPoints
@onready var scissors: Node2D = $scissors
@onready var animation_player: AnimationPlayer = $scissors/AnimationPlayer

const ORANGE_FRUIT = preload("uid://h0gsxojqpun2")


func _ready() -> void:
	spawn_fruits()

# Called when the node enters the scene tree for the first time.
func spawn_fruits():
	for child in fruit_spawn_points.get_children():
		var new_fruit = ORANGE_FRUIT.instantiate()
		new_fruit.global_position = child.global_position
		add_child(new_fruit)

func _process(delta: float) -> void:
	scissors.global_position = get_global_mouse_position()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") or event.is_action_pressed("click"):
		animation_player.play("cut")
