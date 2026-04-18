extends Node2D

@onready var cursor: Node2D = $cursor
@onready var water_sprite: Sprite2D = $cauldron/water_container/waterSprite
@onready var cauldron_sprites: AnimatedSprite2D = $cauldron/cauldron_sprites
@onready var water_boil_sprites: AnimatedSprite2D = $cauldron/water_boil_sprites
@onready var multi_button: Button = $MultiButton
@onready var potion_result_anim: AnimationPlayer = $cauldron/PotionResultAnim

@onready var red_fruits_label: Label = $red_fruit_crate/RedFruitsLabel
@onready var orange_fruits_label: Label = $orange_fruit_crate/OrangeFruitsLabel
@onready var blue_fruits_label: Label = $blue_fruit_crate/BlueFruitsLabel

@onready var deliver_potion_anim: AnimationPlayer = $newPotion/DeliverPotionAnim


var fruit_under : String = "none"
var fruit_on_hold : String = "none"
var over_cauldron := false
var water_in := false
var fruits_on_cauldron : Array = []

var cauldron_timer := 3.0
var cauldron_on := false

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	update_fruit_number()

func update_fruit_number():
	red_fruits_label.text = str(Global.red_fruits)
	orange_fruits_label.text = str(Global.orange_fruits)
	blue_fruits_label.text = str(Global.blue_fruits)

func _on_red_fruit_crate_mouse_entered() -> void:
	if Global.red_fruits > 0:
		fruit_under = "red"
	print(fruit_under)

func _on_orange_fruit_crate_mouse_entered() -> void:
	if Global.orange_fruits > 0:
		fruit_under = "orange"
	print(fruit_under)

func _on_blue_fruit_crate_mouse_entered() -> void:
	if Global.blue_fruits > 0:
		fruit_under = "blue"
	print(fruit_under)

func _on_red_fruit_crate_mouse_exited() -> void:
	fruit_under = "none"
	print(fruit_under)

func _on_orange_fruit_crate_mouse_exited() -> void:
	fruit_under = "none"
	print(fruit_under)

func _on_blue_fruit_crate_mouse_exited() -> void:
	fruit_under = "none"
	print(fruit_under)
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		if fruit_under != "none":
			cursor.grab()
			fruit_on_hold = fruit_under
			cursor.fruit_sprite.visible = true
			cursor.fruit_sprite.animation = fruit_under
		else:
			cursor.fruit_sprite.visible = false
			fruit_on_hold = "none"
	if event.is_action_released("click"):
		cursor.fruit_sprite.animation = "none"
		cursor.fruit_sprite.visible = false
		cursor.normal()
		
		if over_cauldron and fruit_on_hold != "none" and fruits_on_cauldron.size() < 3:
			fruits_on_cauldron.append(fruit_on_hold)
			match fruit_on_hold:
				"red":
					Global.red_fruits -= 1
				"orange":
					Global.orange_fruits -= 1
				"blue":
					Global.blue_fruits -= 1
			update_fruits_on()
			update_fruit_number()
			
		


func _on_cauldron_mouth_mouse_entered() -> void:
	over_cauldron = true

func _on_cauldron_mouth_mouse_exited() -> void:
	over_cauldron = false

func update_fruits_on():
	var i = 1
	for fruit in fruits_on_cauldron:
		match i:
			1:
				$cauldron/fruit_container/fruit1.texture = load("res://assets/png/%s_fruit.png" % fruit)
			2:
				$cauldron/fruit_container/fruit2.texture = load("res://assets/png/%s_fruit.png" % fruit)
			3:
				$cauldron/fruit_container/fruit3.texture = load("res://assets/png/%s_fruit.png" % fruit)
		i += 1
	if fruits_on_cauldron.size() == 3 and water_in:
		multi_button.visible = true

func update_water_on():
	water_sprite.visible = water_in
	cauldron_sprites.play("cauldron_off_water")
	water_boil_sprites.play("cauldron_off_water")
	if fruits_on_cauldron.size() == 3 and water_in:
		multi_button.visible = true
	

func _on_multi_button_pressed() -> void:
	if multi_button.text == "cauldron on!":
		cauldron_sprites.play("cauldron_on")
		multi_button.visible = false
	if multi_button.text == "take potion!":
		take_potion()
		
func _on_cauldron_sprites_animation_finished() -> void:
	if cauldron_sprites.animation == "cauldron_on":
		cauldron_on = true

func boil_water():
	water_boil_sprites.play("water_boiling")
	potion_result()
	

func _process(delta: float) -> void:
	if cauldron_on:
		if cauldron_timer > 0.0:
			cauldron_timer -= delta
		else:
			boil_water()
			cauldron_on = false
			cauldron_timer == 0.0

func end_potion():
	multi_button.text = "take potion!"
	multi_button.visible = true
	cauldron_on = false
	cauldron_sprites.play("cauldron_off")
	water_boil_sprites.play("cauldron_off_water")
	
func take_potion():
	$newPotion/potionSprite.modulate = water_boil_sprites.modulate
	deliver_potion_anim.play("deliver")
	cauldron_sprites.play("cauldron_off")
	water_boil_sprites.play("cauldron_off")

func bad_potion():
	cauldron_on = false
	cauldron_sprites.play("cauldron_off")
	water_boil_sprites.play("cauldron_off")

func potion_result():
	var result : String
	print(fruits_on_cauldron.count("red"))
	if fruits_on_cauldron.count("red") == 3:
		result = "red_potion"
	elif fruits_on_cauldron.count("red") == 2 and fruits_on_cauldron.count("blue") == 1:
		result = "purple_potion"
	elif fruits_on_cauldron.count("orange") == 3:
		result = "yellow_potion"
	elif fruits_on_cauldron.count("orange") == 2 and fruits_on_cauldron.count("red") == 1:
		result = "orange_potion"
	elif fruits_on_cauldron.count("blue") == 3:
		result = "blue_potion"
	elif fruits_on_cauldron.count("blue") == 2 and fruits_on_cauldron.count("orange") == 1:
		result = "green_potion"
	elif fruits_on_cauldron.count("blue") == 1 and fruits_on_cauldron.count("orange") == 1 and fruits_on_cauldron.count("red") == 1:
		result = "cyan_potion"
	else:
		result = "bad_potion"
	water_in = false
	fruits_on_cauldron.clear()
	water_sprite.visible = water_in
	$cauldron/fruit_container/fruit1.texture = null
	$cauldron/fruit_container/fruit2.texture = null
	$cauldron/fruit_container/fruit3.texture = null
	if result != "bad_potion":
		potion_result_anim.play(result)
	else:
		potion_result_anim.play("bad_potion")
	
