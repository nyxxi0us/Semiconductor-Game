extends Control


# This script is responsible for switching between the different 
# minigames and menus in the game. It also handles the score and 
# the timer for the minigames.

const MINIGAMES = ["mini_ions", "mini_oven", "mini_etch", "mini_pack", "mini_plg", "mini_probe"]
const MENUS = ["menu_start", "menu_settings", "menu_finish", "menu_mini"]
var current_scene: String = "menu_start"
var previous_scene: String = ""

func _ready() -> void:
	switch_scene(current_scene)

func switch_scene(scene_name):
	# Logic to switch between different scenes (minigames and menus)
	if scene_name in MINIGAMES or scene_name in MENUS:
		print(scene_name + " is selected")
		previous_scene = current_scene
		current_scene = scene_name
		get_tree().change_scene_to_file("res://scenes/"+scene_name+".tscn")
	else:
		print("Scene not found: ", scene_name)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if current_scene != "menu_settings":
			switch_scene("menu_settings")
		else:
			switch_scene(previous_scene)

func _on_minigame_finished(score):
	# Logic to handle when a minigame is finished
	print("Minigame finished with score: ", score)
	# You can add logic here to update the score, show results, etc.
	switch_scene("menu_finish")  # Switch to the finish menu after a minigame is completed
