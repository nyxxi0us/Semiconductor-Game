extends Node2D


# This script is responsible for switching between the different 
# minigames and menus in the game. It also handles the score and 
# the timer for the minigames.

const MINIGAMES = ["mini_ions", "mini_oven", "mini_etch", "mini_pack", "mini_plg", "mini_probe"]
const MENUS = ["menu_main", "menu_settings", "menu_finish", "menu_mini"]
var current_scene = null
var scene_manager = null
var music_player = null

func _initialize():
	scene_manager = get_tree().get_root().get_node("SceneManager")
	scene_manager.switch_scene(current_scene)
	music_player = get_tree().get_root().get_node("MusicPlayer")
	music_player.play_music("res://assets/music/science.mp3")

func switch_scene(scene_name):
	# Logic to switch between different scenes (minigames and menus)
		if scene_name in MINIGAMES or scene_name in MENUS:
			current_scene = scene_name
			scene_manager.switch_scene(current_scene)
		else:
			print("Scene not found: ", scene_name)
	
func _on_minigame_finished(score):
	# Logic to handle when a minigame is finished
	print("Minigame finished with score: ", score)
	# You can add logic here to update the score, show results, etc.
	switch_scene("menu_finish")  # Switch to the finish menu after a minigame is completed

func _on_menu_selected(menu_name):
	# Logic to handle when a menu is selected
	print("Menu selected: ", menu_name)
	switch_scene(menu_name)  # Switch to the selected menu
