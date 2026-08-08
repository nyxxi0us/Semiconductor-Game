extends Control

@onready var retry_button: Button = $ColorRect/MarginContainer/VBoxContainer/RetryButton
@onready var quit_button: Button = $ColorRect/MarginContainer/VBoxContainer/QuitButton
@onready var save_button: Button = $ColorRect/MarginContainer/VBoxContainer/HBoxContainer/SaveButton
@onready var label: Label = $ColorRect/MarginContainer/VBoxContainer/HBoxContainer/Label
@onready var text_edit: TextEdit = $ColorRect/MarginContainer/VBoxContainer/HBoxContainer/TextEdit


@onready var completed_game = SceneManager.previous_scene
var score = SceneManager.last_score
var score_holder = ""

func _ready():
	save_button.connect("pressed", _on_button_pressed.bind("SaveButton"))
	retry_button.connect("pressed", _on_button_pressed.bind("RetryButton"))
	quit_button.connect("pressed", _on_button_pressed.bind("QuitButton"))

func _on_button_pressed(button_name):
	if button_name == "QuitButton":
		SceneManager.switch_scene("menu_mini")
	elif button_name == "SaveButton":
		SceneManager.save_score(score_holder, score)
	elif button_name == "RetryButton":
		SceneManager.switch_scene(completed_game)


func _on_text_edit_text_changed() -> void:
	score_holder = text_edit.text 
