extends PanelContainer
@onready var red_fruit_count: Label = $MarginContainer/VBoxContainer/RedFruitContainer/RedFruitCount
@onready var orange_fruit_count: Label = $MarginContainer/VBoxContainer/OrangeFruitContainer/OrangeFruitCount
@onready var blue_fruit_count: Label = $MarginContainer/VBoxContainer/BlueFruitContainer/BlueFruitCount

@onready var red_fruit_add: Label = $MarginContainer/VBoxContainer/RedFruitContainer/RedFruitAdd
@onready var orange_fruit_add: Label = $MarginContainer/VBoxContainer/OrangeFruitContainer/OrangeFruitAdd
@onready var blue_fruit_add: Label = $MarginContainer/VBoxContainer/BlueFruitContainer/BlueFruitAdd


func _ready() -> void:
	update_fruits()

func update_fruits():
	Global.red_fruits += Global.added_red_fruits
	Global.orange_fruits += Global.added_orange_fruits
	Global.blue_fruits += Global.added_blue_fruits
	red_fruit_count.text = "- %s" % str(Global.red_fruits)
	orange_fruit_count.text = "- %s" % str(Global.orange_fruits)
	blue_fruit_count.text = "- %s" % str(Global.blue_fruits)

func update_added_fruits_label():
	red_fruit_add.text = "+%s" % str(Global.added_red_fruits)
	orange_fruit_add.text = "+%s" % str(Global.added_orange_fruits)
	blue_fruit_add.text = "+%s" % (Global.added_blue_fruits)

func reset_added_fruits():
	Global.added_red_fruits = 0
	Global.added_orange_fruits = 0
	Global.added_blue_fruits = 0
