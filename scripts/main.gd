class_name MainScene extends Control


# This script is responsible for switching between the different 
# minigames and menus in the game. It also handles the score and 
# the timer for the minigames.

const MINIGAMES = ["mini_ions", "mini_oven", "mini_etch", "mini_pack", "mini_plg", "mini_probe"]
const MENUS = ["menu_start", "menu_settings", "menu_finish", "menu_mini"]
var current_scene: String = "menu_start"
var previous_scene: String = ""
var current_track_number: int = 0
var music = []
var music_path = "res://music/"

@onready var music_player: AudioStreamPlayer = $MusicPlayer

func _init() -> void:
	load_audio_from_folder()

func _ready() -> void:
	switch_scene(current_scene)
	play_music()

func switch_scene(scene_name):
	# Logic to switch between different scenes (minigames and menus)
		if scene_name in MINIGAMES or scene_name in MENUS:
			previous_scene = current_scene
			current_scene = scene_name
			get_tree().change_scene_to_file("res://scenes/menu_start.tscn")
		else:
			print("Scene not found: ", scene_name)

func load_audio_from_folder():
	var dir = DirAccess.open(music_path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name!= "":
			file_name = dir.get_next()
			var full_path = music_path + file_name
			var loaded_stream = load(full_path) as AudioStreamMP3
			if loaded_stream:
				music.append(loaded_stream)
		dir.list_dir_end()

func play_music():
	if !music_player.playing:
		music_player.set_stream(music[(current_track_number+1)%music.size()])
		music_player.play()

func _input(event: InputEvent) -> void:
	if event.is_action("ui_cancel"):
		if current_scene != "menu_settings":
			switch_scene("menu_settings")
		else:
			switch_scene(previous_scene)

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
