extends Control

var current_track_number: int = 0
var music = []
var music_path = "res://music/"

@onready var music_player: AudioStreamPlayer = $MusicPlayer

func _init() -> void:
	load_audio_from_folder()

func _ready() -> void:
	music_player.connect("finished", _on_music_player_finished)
	play_music()

func load_audio_from_folder():
	var dir = DirAccess.open(music_path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name!= "":
			file_name = dir.get_next()
			var full_path = music_path + file_name
			var loaded_stream = load(full_path) as AudioStreamMP3
			if loaded_stream:
				music.append(loaded_stream)
		dir.list_dir_end()

func play_music():
	if !music_player.playing:
		music_player.set_stream(music[(current_track_number+1)%music.size()])
		music_player.play()


func _on_music_player_finished():
	#Logic to loop music
	play_music()
