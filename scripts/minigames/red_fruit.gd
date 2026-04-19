extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var falling := false
var on_ground := false

func _on_body_entered(body: Node2D) -> void:
	if body is FruitMinigamePlayer and !on_ground:
		AudioManager.play_fruit_collect()
		get_parent().red_fruits += 1
		queue_free()
		get_parent().check_minigame_end()

func shake():
	var result = randi_range(1,10)
	if result > 8:
		fall()
	else:
		animation_player.play("shake")

func fall():
	falling = true
	remove_from_group("fruits")
	
func _process(delta: float) -> void:
	if falling:
		position.y += 100 * delta

func _on_area_entered(area: Area2D) -> void:
	if area.name == "groundArea":
		falling = false
		on_ground = true
		animated_sprite_2d.play("bad")
		get_parent().check_minigame_end()
