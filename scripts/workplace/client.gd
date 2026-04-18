extends Node2D

@onready var client_sprite: AnimatedSprite2D = $clientSprite
@onready var disease_sprite: AnimatedSprite2D = $diseaseSprite

var client : int = -1

var diseases : Array = ["amoeba", "anemia", "bone", "cold", "confusion", "fever"]
var disease : String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	client_sprite.frame = client
	if disease == "":
		disease = diseases.pick_random()
		disease_sprite.play(disease)
