extends Control

const MINIGAMES = ["mini_ions", "mini_oven", "mini_etch", "mini_pack", "mini_plg", "mini_probe"]

func _ready():

    for button in get_children():
        if button is Button:
            button.connect("pressed", self, "_on_button_pressed", [button.name])

func _on_button_pressed(button_name):
    if button_name in MINIGAMES:
        main.switch_scenes(button_name)
    else if button_name == "BackButton":
        main.switch_scenes("menu_main")
    else:
        print("Button pressed: ", button_name)