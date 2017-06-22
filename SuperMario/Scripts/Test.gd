extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)

func _process(delta):
	VisualServer.set_default_clear_color(Color(0.0, 0.0, 0.0, 1.0))

