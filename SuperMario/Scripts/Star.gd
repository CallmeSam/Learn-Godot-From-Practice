extends RigidBody2D

export var speed = 100.0

func _ready():
	set_fixed_process(true)
	set_linear_velocity(Vector2(speed, speed))

func _fixed_process(delta):
	print(get_linear_velocity())
	pass

func _on_Area2D_body_enter( body ):
	if body.get_name() == "Mario":
		body.starUp()
		queue_free()
	else:
		pass

func _on_Star_body_enter( body ):
	set_linear_velocity(get_linear_velocity() * Vector2(-1, -1))
