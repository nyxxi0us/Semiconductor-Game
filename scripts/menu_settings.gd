class_name Settings extends Control

@onready var sfx_volume_slider: HSlider = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/SFXVolumeSlider
@onready var music_volume_slider: HSlider = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/MusicVolumeSlider
@onready var fullscreen_checkbox: CheckBox = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/FullscreenCheckbox

func _ready() -> void:
	var video_settings = ConfigFileHandler.load_video_settings()
	var audio_settings = ConfigFileHandler.load_audio_settings()
	
	fullscreen_checkbox.button_pressed = video_settings.fullscreen
	music_volume_slider.value = min(audio_settings.music_volume, 1.0)*100
	sfx_volume_slider.value = min(audio_settings.sfx_volume, 1.0)*100

func _on_fullscreen_checkbox_toggled(toggled_on: bool) -> void:
	ConfigFileHandler.save_video_setting("fullscreen", toggled_on)
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_sfx_volume_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		ConfigFileHandler.save_audio_setting("sfx_volume",sfx_volume_slider.value/100)
		AudioServer.set_bus_volume_db(1, sfx_volume_slider.value)

func _on_music_volume_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		ConfigFileHandler.save_audio_setting("music_volume", music_volume_slider.value/100)
		AudioServer.set_bus_volume_db(2,music_volume_slider.value)
