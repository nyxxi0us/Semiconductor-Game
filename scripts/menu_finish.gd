extends Control

@onready var back_button: Button = $BackButton
@onready var quit_button: Button = $QuitButton
@onready var retry_button: Button = $RetryButton

func _ready():
	for button in get_children():
		if button is Button:
			button.connect("pressed", _on_button_pressed.bind(button.name))
	
func _on_button_pressed(button_name):
	if button_name == "BackButton":
		SceneManager.switch_scene("menu_mini")
	elif button_name == "QuitButton":
		get_tree().quit()
	elif button_name == "RetryButton":
		SceneManager.switch_scene(SceneManager.current_scene)
