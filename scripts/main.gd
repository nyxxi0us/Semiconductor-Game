class_name GlobalMain extends Node2D


# This script is responsible for switching between the different 
# minigames and menus in the game. It also handles the score and 
# the timer for the minigames.

const MINIGAMES = ["mini_ions", "mini_oven", "mini_etch", "mini_pack", "mini_plg", "mini_probe"]
const MENUS = ["menu_main", "menu_settings", "menu_finish", "menu_mini"]
var current_scene: String = ""
var current_track_number: int = 0
var music[AudioStreamMP3] = []

@onready var music_player: AudioStreamPlayer = $MusicPlayer

func _initialize():
	switch_scene(current_scene)
	for file in folder:
		music.add(AudioStreamMP3.load_from_file("res://music/"+file.name))
	play_music()

func switch_scene(scene_name):
	# Logic to switch between different scenes (minigames and menus)
		if scene_name in MINIGAMES or scene_name in MENUS:
			current_scene = scene_name
			switch_scene(current_scene)
		else:
			print("Scene not found: ", scene_name)

func play_music():
	if !music_player.playing
		music_player.set_stream(music[current_track_number+1])
		music_player.play()
	
func _on_minigame_finished(score):
	# Logic to handle when a minigame is finished
	print("Minigame finished with score: ", score)
	# You can add logic here to update the score, show results, etc.
	switch_scene("menu_finish")  # Switch to the finish menu after a minigame is completed

func _on_menu_selected(menu_name):
	# Logic to handle when a menu is selected
	print("Menu selected: ", menu_name)
	switch_scene(menu_name)  # Switch to the selected menu

func _on_music_player_finished():
	#Logic to loop music
	play_music()
