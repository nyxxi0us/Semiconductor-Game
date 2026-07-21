extends CanvasLayer

enum Menubuttons {
    START,
    SETTINGS,
    QUIT
}

@onready Button StartButton = get_node("VBoxContainer/StartButton")
@onready Button SettingsButton = get_node("VBoxContainer/SettingsButton")
@onready Button QuitButton = get_node("VBoxContainer/QuitButton")

func _ready():
    # Connect button signals
    StartButton.connect("pressed", self, "_on_start_button_pressed")
    SettingsButton.connect("pressed", self, "_on_settings_button_pressed")
    QuitButton.connect("pressed", self, "_on_quit_button_pressed")

func _on_start_button_pressed():
    # Switch to the minigame scene
    main.switch_scenes("menu_mini")

func _on_settings_button_pressed():
    # Switch to the settings menu scene
    main.switch_scenes("menu_settings")

func _on_quit_button_pressed():
    # Quit the game
    get_tree().quit()