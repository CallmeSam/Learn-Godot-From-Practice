extends RichTextLabel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var count = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	self.add_text("This is a text from inner side !!!!!!!!!!!")


func _on_Timer_timeout():
	count += 0.1
	self.clear()
	self.add_text(str("Elapsed seconds = ", count))
