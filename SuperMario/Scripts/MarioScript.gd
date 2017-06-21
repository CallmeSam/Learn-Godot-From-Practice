extends RigidBody2D

var speed = 60

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	if Input.is_action_pressed("jump"):
		pass
	if Input.is_action_pressed("move_left"):
		set_linear_velocity(Vector2(-speed, get_linear_velocity().y))
	if Input.is_action_pressed("move_right"):
		set_linear_velocity(Vector2(speed, get_linear_velocity().y))
