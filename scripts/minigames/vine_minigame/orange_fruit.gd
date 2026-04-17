extends Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation_degrees = randi_range(-45, 45)



func _on_area_entered(area: Area2D) -> void:
	if area.name == "cutArea":
		animation_player.play("cut")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "cut":
		queue_free()
