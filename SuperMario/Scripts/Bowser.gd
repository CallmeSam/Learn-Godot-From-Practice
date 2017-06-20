extends Sprite

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	set_process_input(true)

func _on_Timer_timeout():
	self.rotate(deg2rad(4.5))
	
func _process(delta):
	self.translate(Vector2(0, 0.1))
	if self.get_pos().y + self.get_item_rect().size.y/2 > self.get_viewport_rect().size.y:
		self.set_pos(Vector2(self.get_pos().x, self.get_item_rect().size.y / 2))

func _input(event):
	#if event.type == InputEvent.MOUSE_BUTTON:
	#	if event.button_index == BUTTON_LEFT:
	#		self.set_pos(Vector2(event.x, event.y))
		
	if event.type == InputEvent.KEY:
		var pos = self.get_pos();
		
		if event.scancode == KEY_RIGHT:
			pos.x += 10
			self.set_pos(pos)
		
		if event.scancode == KEY_LEFT:
			pos.x -= 10
			self.set_pos(pos)
			
		if event.scancode == KEY_ESCAPE:
			self.get_tree().quit()
		

func _on_Button_button_down():
	#self.get_parent().get_node("SamplePlayer").play("bowserfall")
	#self.get_parent().get_node("SamplePlayer").play("bowserfall", true)
	var player = get_parent().get_node("SamplePlayer")
	var voiceID = player.play("bowserfall")
	player.set_volume(voiceID, 0.5)
   
