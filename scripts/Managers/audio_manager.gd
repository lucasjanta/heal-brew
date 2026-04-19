extends Node2D

@onready var fruit_drop: AudioStreamPlayer = $fruit_drop
@onready var fruit_collect_sfx: AudioStreamPlayer = $fruit_collect
@onready var main_menu_music: AudioStreamPlayer = $main_menu_music
@onready var forest_music: AudioStreamPlayer = $forest_music
@onready var workplace_music: AudioStreamPlayer = $workplace_music

@onready var new_potion_sfx: AudioStreamPlayer = $new_potion_SFX
@onready var game_over: AudioStreamPlayer = $game_over
@onready var kick: AudioStreamPlayer = $kick
@onready var owl: AudioStreamPlayer = $owl
@onready var monster_attack: AudioStreamPlayer = $monsterAttack




func play_main_menu_music():
	stop_all_music()
	main_menu_music.play()

func play_forest_music():
	stop_all_music()
	forest_music.play()	

func play_workplace_music():
	stop_all_music()
	workplace_music.play()

func stop_all_music():
	workplace_music.stop()
	main_menu_music.stop()
	forest_music.stop()

func play_new_potion_sfx():
	new_potion_sfx.play()

func play_fruit_drop():
	fruit_drop.play()

func play_fruit_collect():
	fruit_collect_sfx.pitch_scale = randf_range(0.8, 1.2)
	fruit_collect_sfx.play()

func play_game_over():
	stop_all_music()
	game_over.play()

func play_kick():
	kick.play()

func play_owl():
	owl.play()
	
func play_monster_attack():
	monster_attack.play()
