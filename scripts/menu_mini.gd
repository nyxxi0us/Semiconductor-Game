extends Control

const MINIGAMES = ["mini_ions", "mini_oven", "mini_etch", "mini_pack", "mini_plg", "mini_probe"]


@onready var carousel_container: CarouselContainer = $CarouselContainer
@onready var mini_buttons = $CarouselContainer/Control.get_children()
@onready var right_button: Button = $HBoxContainer/RightButton
@onready var left_button: Button = $HBoxContainer/LeftButton


func _ready():
	left_button.connect("pressed", _on_button_pressed.bind("LeftButton"))
	right_button.connect("pressed", _on_button_pressed.bind("RightButton"))
	for button in mini_buttons:
		if button is Button:
			button.connect("pressed", _on_button_pressed.bind(button.name))
	mini_buttons[carousel_container.selected_index].grab_focus()		


func _on_button_pressed(button_name):
	if button_name in MINIGAMES:
		print(button_name + " was pressed")
		MainScene.switch_scene(button_name)
	elif button_name == "LeftButton":
		carousel_container._left()
	elif button_name == "RightButton":
		carousel_container._right()
	elif button_name == "BackButton":
		MainScene.switch_scene("menu_main")
	else:
		print("Button pressed: ", button_name)
