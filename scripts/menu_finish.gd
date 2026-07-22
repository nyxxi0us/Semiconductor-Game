extends Control

@onready var back_button: Button = $BackButton
@onready var quit_button: Button = $QuitButton
@onready var retry_button: Button = $RetryButton

func _ready():
    for button in get_children():
        if button is Button:
            button.connect("pressed", self, "_on_button_pressed", [button.name])
    
func _on_button_pressed(button_name):
    if button_name == "BackButton":
        main.switch_scene("menu_mini")
    elif button_name == "QuitButton":
        get_tree().quit()
    elif button_name == "RetryButton":
        main.switch_scene(main.current_scene)
    else:
        print("Button pressed: ", button_name)