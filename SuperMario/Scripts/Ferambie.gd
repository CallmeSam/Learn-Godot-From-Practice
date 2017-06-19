extends StreamPlayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var s1
var s2
var cur = s1

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	self.set_process(true)
	self.play()
	
func _process(delta):
	pass
