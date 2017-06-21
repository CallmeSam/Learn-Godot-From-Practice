extends VBoxContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_NewGame_pressed():
	print("NewGame button pressed!!!")
	

func _on_Load_pressed():
	print("Load button pressed!!!")


func _on_Quit_pressed():
	print("Quit button pressed!!!")

func _on_Settings_pressed():
	print("Settings button pressed!!!")
	

func _on_Guess_pressed():
	print("Guess button pressed!!!")
	get_node("/root/GlobalSwitch").setScene("res://Scenes/MarioHUD.tscn")
