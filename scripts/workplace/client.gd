extends Node2D

@onready var client_sprite: AnimatedSprite2D = $clientSprite
@onready var disease_sprite: AnimatedSprite2D = $diseaseSprite
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var client : int = -1
var waiting := false
var desired_potion : String = ""
var leaving := false
var diseases : Array = ["amoeba", "anemia", "bone", "cold", "confusion", "fever"]
var disease : String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	client_sprite.frame = client
	if disease == "":
		disease = diseases.pick_random()
		disease_sprite.play(disease)

func _process(delta: float) -> void:
	if leaving:
		position.x += delta * 75
		animation_player.play("leave")
	if position.x > 390.0:
		queue_free()
	
func wait():
	waiting = true
	print("client waiting")
	match disease:
		"amoeba":
			desired_potion = "orange_potion"
		"anemia":
			desired_potion = "red_potion"
		"bone":
			desired_potion = "green_potion"
		"cold":
			desired_potion = "yellow_potion"
		"confusion":
			desired_potion = "blue_potion"
		"fever":
			desired_potion = "purple_potion"
		"forever":
			desired_potion = "cyan_potion"



func _on_deliver_button_pressed() -> void:
	if waiting and Global.potion_created:
		print("the desired potion was %s" % desired_potion)
		print("and the delivered potion was %s" %  Global.potion_in_hand)
		if desired_potion == Global.potion_in_hand:
			Global.people_treated += 1
		else:
			Global.mistakes += 1
		get_parent().update_ui()
		leaving = true
		animation_player.play("leave")
		get_parent().new_client()
