extends RigidBody2D

export var speedMax = 300
export var jumpForce = 200.0
export var acceleration = 3.0
export var airAcceleration = 1.0

var raycastNode = null
var rotateNode = null
var inputStates = preload("res://Scripts/InputStates.gd")
var jump = inputStates.new("jump")
var moveLeft = inputStates.new("move_left")
var moveRight = inputStates.new("move_right")

var PLAYERSTATE_PREV = ""
var PLAYERSTATE = ""
var PLAYERSTATE_NEXT = "ground"

var ORIANTATION_PREV = ""
var ORIANTATION = ""
var ORIANTATION_NEXT = "right"

func _ready():
	raycastNode = get_node("RayCast2D")
	raycastNode.add_exception(self)
	set_fixed_process(true)


func _fixed_process(delta):
	PLAYERSTATE_PREV = PLAYERSTATE
	PLAYERSTATE = PLAYERSTATE_NEXT

	ORIANTATION_PREV = ORIANTATION
	ORIANTATION = ORIANTATION_NEXT

	if PLAYERSTATE == "ground":
		groundState(delta)
	elif PLAYERSTATE == "air":
		airState(delta)
	print(PLAYERSTATE)

func groundState(delta):
	if moveLeft.check() == 2:
		ORIANTATION_NEXT = "left"
		move_x(get_linear_velocity(), -speedMax, acceleration, delta)
	elif moveRight.check() == 2:
		ORIANTATION_NEXT = "right"
		move_x(get_linear_velocity(), speedMax, acceleration, delta)
	else:
		move_x(get_linear_velocity(), 0, acceleration/2, delta)

	rotateBehavior()

	if raycastNode.is_colliding():
		if jump.check() == 1:
			set_axis_velocity(Vector2(0, -jumpForce))
	else:
		PLAYERSTATE_NEXT = "air"

func airState(delta):
	if moveLeft.check() == 2:
		ORIANTATION_NEXT = "left"
		move_x(get_linear_velocity(), -speedMax, airAcceleration, delta)
	elif moveRight.check() == 2:
		ORIANTATION_NEXT = "right"
		move_x(get_linear_velocity(), speedMax, airAcceleration, delta)
	else:
		move_x(get_linear_velocity(), 0, airAcceleration/2, delta)

	rotateBehavior()

	if raycastNode.is_colliding():
		PLAYERSTATE_NEXT = "ground"

func rotateBehavior():
	if ORIANTATION != ORIANTATION_NEXT:
		get_node("AnimatedSprite").set_scale(get_node("AnimatedSprite").get_scale() * Vector2(-1, 1))

func move_x(current_speed, max_speed, acceleration, delta):
	set_linear_velocity(Vector2(lerp(current_speed.x, max_speed, delta * acceleration), get_linear_velocity().y))
