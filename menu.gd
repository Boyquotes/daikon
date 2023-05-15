extends Node2D


@onready var tree = get_tree()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	pass


func _on_credits_pressed():
	tree.change_scene_to_file('credits.tscn')


func _on_quit_pressed():
	tree.quit()
