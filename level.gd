extends Node2D

@onready var music = get_node('Music')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_music_finished():
	music.play()


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scene_one/puzzle_1.tscn")

