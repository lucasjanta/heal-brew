extends Node

var scene_manager : Node

var red_fruits : int = 0
var orange_fruits : int = 0
var blue_fruits : int = 0


var added_red_fruits : int = 0
var added_orange_fruits : int = 0
var added_blue_fruits : int = 0

var getting_back := false

var forest_first_time := true
var workplace_first_time := true
var fruitfall_first_time := true
var vine_first_time := true
var weird_first_time := true

var day : int = 1
var potion_created := false
var potion_in_hand : String = ""
var people_treated : int = 0
var mistakes : int = 0

var king_mistake := false
var king_healed := false
