extends Node

func _ready():
	var root = get_node("/root")
	root.connect("size_changed", self, "resize")
	#OS.set_window_fullscreen(true)
	set_process_input(true)

func resize():
	var root = get_node("/root")
	var resolution = root.get_rect()
	print(resolution)

func _input(event):
	if event.is_pressed():
		if event.scancode == KEY_ESCAPE:
			get_tree().quit()
		else:
			pass
