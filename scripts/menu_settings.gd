extends Control

dict SETTINGS = {
    "music_volume": 0.5,
    "sfx_volume": 0.5,
    "fullscreen": false
}

@onready var music_volume_slider: HSlider = $MusicVolumeSlider
@onready var sfx_volume_slider: HSlider = $SFXVolumeSlider
@onready var fullscreen_checkbox: CheckBox = $FullscreenCheckbox

func _ready():
    # Load settings from a file or set default values
    load_settings()
    # Connect signals for UI elements (e.g., sliders, checkboxes)
    connect_ui_signals()

func load_settings():
    # Load settings from a file (if exists) or use default values
    var settings_file = File.new()
    if settings_file.file_exists("user://settings.cfg"):    
        settings_file.open("user://settings.cfg", File.READ)
        var loaded_settings = parse_json(settings_file.get_as_text())
        SETTINGS.update(loaded_settings)
        settings_file.close()
    else:
        save_settings()  # Save default settings if no file exists 

func save_settings():
    # Save current settings to a file
    var settings_file = File.new()
    settings_file.open("user://settings.cfg", File.WRITE)
    settings_file.store_string(to_json(SETTINGS))

func connect_ui_signals():
    # Connect signals for UI elements to update settings
    $MusicVolumeSlider.connect("value_changed", self, "_on_music_volume_changed")
    $SFXVolumeSlider.connect("value_changed", self, "_on_sfx_volume_changed")
    $FullscreenCheckbox.connect("toggled", self, "_on_fullscreen_toggled")