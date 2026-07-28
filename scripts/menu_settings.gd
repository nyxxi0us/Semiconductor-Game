class_name Settings extends Control

var SETTINGS: Dictionary = {
	"music_volume": 0.5,
	"sfx_volume": 0.5,
	"fullscreen": false
}

@onready var sfx_volume_slider: HSlider = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/SFXVolumeSlider
@onready var music_volume_slider: HSlider = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/MusicVolumeSlider
@onready var fullscreen_checkbox: CheckBox = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/FullscreenCheckbox

func _ready():
	# Load settings from a file or set default values
	load_settings()
	# Connect signals for UI elements (e.g., sliders, checkboxes)
	connect_ui_signals()

func load_settings():
	# Load settings from a file (if exists) or use default values
	pass

func save_settings():
	# Save current settings to a file
	pass
	
func connect_ui_signals():
	# Connect signals for UI elements to update settings
	music_volume_slider.connect("value_changed", _on_music_volume_changed)
	sfx_volume_slider.connect("value_changed", _on_sfx_volume_changed)
	fullscreen_checkbox.connect("toggled", _on_fullscreen_toggled)

func _on_music_volume_changed():
	SETTINGS["music_volume"] = music_volume_slider.value

func _on_sfx_volume_changed():
	SETTINGS["sfx_volume"] = sfx_volume_slider.value

func _on_fullscreen_toggled():
	SETTINGS["fullscreen"] = fullscreen_checkbox.button_pressed
