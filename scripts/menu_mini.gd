extends Control

const MINIGAMES = ["mini_ions", "mini_oven", "mini_etch", "mini_pack", "mini_plg", "mini_probe"]

@onready var mini_buttons: Array[Node] = $ColorRect/MarginContainer/HBoxContainer/VBoxContainer/Control.get_children()
@onready var carousel_container: CarouselContainer = $CarouselContainer

@onready var left_button: Button = $ColorRect/MarginContainer/HBoxContainer/LeftButton
@onready var back_button: Button = $ColorRect/MarginContainer/HBoxContainer/VBoxContainer/BackButton
@onready var right_button: Button = $ColorRect/MarginContainer/HBoxContainer/RightButton


func _ready():
	left_button.connect("pressed", _on_button_pressed.bind("LeftButton"))
	right_button.connect("pressed", _on_button_pressed.bind("RightButton"))
	back_button.connect("pressed", _on_button_pressed.bind("BackButton"))
	for button in mini_buttons:
		if button is Button:
			button.connect("pressed", _on_button_pressed.bind(button.name))
	mini_buttons[carousel_container.selected_index].grab_focus()		


func _on_button_pressed(button_name):
	if button_name in MINIGAMES:
		SceneManager.switch_scene(button_name)
	elif button_name == "LeftButton":
		carousel_container._left()
	elif button_name == "RightButton":
		carousel_container._right()
	elif button_name == "BackButton":
		SceneManager.switch_scene("menu_start")
	else:
		print("Button pressed: ", button_name)
