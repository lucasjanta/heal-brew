extends Area2D
@onready var interact_label: Label = $InteractLabel
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var can_interact := false
var available := true

func interact():
	available = false
	animated_sprite_2d.play("unavailable")
	Global.scene_manager.change_2D_scene("res://scenes/minigames/vine_minigame.tscn", false, false)
	if Global.vine_first_time:
		Global.vine_first_time = false
		Global.scene_manager.change_gui_scene("res://scenes/UI/vine_tree_tutorial.tscn", true, false)
	


func _on_body_entered(body: Node2D) -> void:
	if body is Player and available:
		can_interact = true
		interact_label.visible = true
		
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and can_interact and available:
		collision_shape_2d.disabled = true
		interact()


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		can_interact = false
		interact_label.visible = false
