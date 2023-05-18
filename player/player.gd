extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim = get_node("AnimationPlayer")
@onready var node = get_node("AnimatedSprite2D")
@onready var body = get_node('.')

var jump = 0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up")) and jump < 1:
		velocity.y = JUMP_VELOCITY
		jump += 1
		anim.play('Jump')
	
	if is_on_floor():
		jump = 0
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction > 0:
		node.flip_h = false
	elif direction < 0:
		node.flip_h = true
	
	if direction:
		for i in body.get_slide_collision_count():
			var col = body.get_slide_collision(i)
			if col.get_collider() is RigidBody2D:
				col.get_collider().apply_force(col.get_normal() * -5000)
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play('Run')
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_fallzone_body_entered(body):
	get_tree().change_scene_to_file("res://level.tscn")
