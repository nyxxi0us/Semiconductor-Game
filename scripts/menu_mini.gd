extends Control

const MINIGAMES = ["mini_ions", "mini_oven", "mini_etch", "mini_pack", "mini_plg", "mini_probe"]

func _ready():
	for button in get_children():
		if button is Button:
			button.connect("pressed", _on_button_pressed.bind(button.name))

func _on_button_pressed(button_name):
	if button_name in MINIGAMES:
		Main.switch_scenes(button_name)
	elif button_name == "BackButton":
		Main.switch_scenes("menu_main")
	else:
		print("Button pressed: ", button_name)
