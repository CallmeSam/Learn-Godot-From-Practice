extends KinematicBody2D

var pos_init
var speed = 100.0
var len = 200.0

func _ready():
	pos_init= get_pos()
	set_process(true)
	
func _process(delta):
	translate(Vector2(speed * delta, 0))
	
	if get_pos().x >= pos_init.x + len || get_pos().x <= pos_init.x:
		speed *= -1
