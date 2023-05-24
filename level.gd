extends Node2D

@onready var music = get_node('Music')

# Called when the node enters the scene tree for the first time.
func _ready():
	$OldDaikon/Hint.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_music_finished():
	music.play()


func _on_old_daikon_body_exited(body):
	$OldDaikon/Hint.visible = false


func _on_old_daikon_body_entered(body):
	if body.name == "Daikon":
		$OldDaikon/Hint.visible = true



