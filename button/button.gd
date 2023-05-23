extends RigidBody2D


@onready var text = get_node('Action Text')
@onready var banana = get_parent().get_node('Banana 1')
var track = false


func _input(event):
	if track and event is InputEventKey and event.as_text() == 'E' and event.is_pressed():
		banana.apply_force(Vector2(500, 50))


func _on_player_detection_body_entered(body):
	if body.name == 'Daikon':
		text.visible = true
		track = true


func _on_player_detection_body_exited(body):
	if body.name == 'Daikon':
		text.visible = false
		track = false
