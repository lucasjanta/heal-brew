extends Control
@onready var mistakes_container: VBoxContainer = $PanelContainer/MarginContainer/VBoxContainer/MistakesContainer
@onready var king_container: VBoxContainer = $PanelContainer/MarginContainer/VBoxContainer/KingContainer
@onready var king_fail_container: VBoxContainer = $PanelContainer/MarginContainer/VBoxContainer/KingFailContainer
@onready var label: Label = $PanelContainer/MarginContainer/VBoxContainer/Label

@onready var endgame_menu: VBoxContainer = $PanelContainer/MarginContainer/VBoxContainer
@onready var credits_container: VBoxContainer = $PanelContainer/MarginContainer/creditsContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.king_mistake:
		king_fail_container.visible = true
		king_container.visible = false
		mistakes_container.visible = false
	elif Global.king_healed:
		king_fail_container.visible = false
		king_container.visible = true
		mistakes_container.visible = false
	elif Global.mistakes == 3:
		king_fail_container.visible = false
		king_container.visible = false
		mistakes_container.visible = true
		
	label.text = "People Healed: %s" % str(Global.people_treated)


func _on_button_pressed() -> void:
	credits_container.visible = false
	endgame_menu.visible = true


func _on_credits_button_pressed() -> void:
	credits_container.visible = true
	endgame_menu.visible = false


func _on_play_again_button_pressed() -> void:
	Global.red_fruits = 0
	Global.orange_fruits = 0
	Global.blue_fruits = 0


	Global.added_red_fruits = 0
	Global.added_orange_fruits = 0
	Global.added_blue_fruits = 0

	Global.getting_back = false

	Global.forest_first_time = true
	Global.workplace_first_time = true
	Global.fruitfall_first_time = true
	Global.vine_first_time = true
	Global.weird_first_time = true

	Global.day  = 1
	Global.potion_created = false
	Global.potion_in_hand  = ""
	Global.people_treated = 0
	Global.mistakes = 0

	Global.king_mistake = false
	Global.king_healed = false
	Global.scene_manager.change_gui_scene("res://scenes/UI/main_menu.tscn", true, false)
	Global.scene_manager.change_2D_scene("res://scenes/reset/blank_2d.tscn", true, false)
