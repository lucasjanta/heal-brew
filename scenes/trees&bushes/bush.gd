extends Area2D
@onready var interact_label: Label = $InteractLabel

var can_interact := false
var available := true

func interact():
	print("go to minigame")


func _on_body_entered(body: Node2D) -> void:
	if body is Player and available:
		can_interact = true
		interact_label.visible = true
		
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		interact()


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		can_interact = false
		interact_label.visible = false
