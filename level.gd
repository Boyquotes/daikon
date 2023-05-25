extends Node2D

@onready var music = get_node('Music')

# Called when the node enters the scene tree for the first time.
func _ready():
	$Mechanic/Hint.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_music_finished():
	music.play()


func _on_old_daikon_body_exited(body):
	$Mechanic/Hint.visible = false


func _on_old_daikon_body_entered(body):
	if body.name == "Daikon":
		$Mechanic/Hint.visible = true



func _on_button_pressed():
	get_tree().change_scene_to_file("res://scene_one/puzzle_1.tscn")

