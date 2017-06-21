extends MenuButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process(true)
	
func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		self.get_node("/root/GlobalSwitch").setScene("res://Scenes/MarioHUD.tscn")
