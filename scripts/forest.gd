extends Node2D

@onready var animation_player: AnimationPlayer = $CanvasLayer/FruitsContainer/AnimationPlayer
@onready var movable_witch: Player = $movable_witch

func _process(delta: float) -> void:
	if Global.getting_back:
		Global.getting_back = false
		check_fruits()
	if movable_witch.global_position.x < -30 or movable_witch.global_position.x > 390.0 or movable_witch.global_position.y > 210.0 or movable_witch.global_position.y < -30:
		Global.scene_manager.change_2D_scene("res://scenes/cart/workplace.tscn", true, false)

func check_fruits():
	if Global.added_red_fruits > 0:
		animation_player.play("add_red")
	if Global.added_orange_fruits > 0:
		animation_player.play("add_orange")
	if Global.added_blue_fruits > 0:
		animation_player.play("add_blue")
