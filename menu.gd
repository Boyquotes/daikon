extends Control


@onready var tree = get_tree()
@onready var audio = get_node('Music')
@onready var button = get_node('Button')

var scene = ''


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	button.play()
	scene = 'level.tscn'


func _on_credits_pressed():
	button.play()
	scene = 'credits.tscn'


func _on_quit_pressed():
	tree.quit()


func _on_audio_stream_player_finished():
	audio.play()


func _on_button_finished():
	tree.change_scene_to_file(scene)
