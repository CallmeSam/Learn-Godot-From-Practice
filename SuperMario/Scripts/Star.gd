extends RigidBody2D

export var speed = 100.0

func _ready():
	set_fixed_process(true)
	set_process(true)
	set_linear_velocity(Vector2(speed, speed))
	var sample = get_node("SamplePlayer2D").get_sample_library().get_sample("starmusic")
	sample.set_loop_format(AudioServer.SAMPLE_LOOP_FORWARD)
	sample.set_loop_begin(0)
	sample.set_loop_end(sample.get_length())
	get_node("SamplePlayer2D").play("starmusic")

func _fixed_process(delta):
	pass


func _on_Area2D_body_enter( body ):
	if body.get_name() == "Mario":
		body.starUp()
		queue_free()
	else:
		pass

func _on_Star_body_enter( body ):
	set_linear_velocity(get_linear_velocity() * Vector2(-1, -1))
