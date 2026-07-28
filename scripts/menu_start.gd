extends Control

enum Menubuttons {
	START,
	SETTINGS,
	QUIT
}

@onready var start_button: Button = $ColorRect/MarginContainer/VBoxContainer/StartButton
@onready var quit_button: Button = $ColorRect/MarginContainer/VBoxContainer/QuitButton
@onready var settings_button: Button = $ColorRect/MarginContainer/VBoxContainer/SettingsButton


func _ready():
	# Connect button signals
	start_button.connect("pressed", _on_start_button_pressed)
	settings_button.connect("pressed", _on_settings_button_pressed)
	quit_button.connect("pressed", _on_quit_button_pressed)

func _on_start_button_pressed():
	# Switch to the minigame scene
	MainScene.switch_scene("menu_mini")

func _on_settings_button_pressed():
	# Switch to the settings menu scene
	MainScene.switch_scene("menu_settings")

func _on_quit_button_pressed():
	# Quit the game
	get_tree().quit()
