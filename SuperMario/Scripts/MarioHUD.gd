extends Node

export var countDown = 400
var count = 0

func _ready():
	get_node("CanvasLayer/Timer").start()
	get_node("CanvasLayer/Time").set_text(str("TIME\n", countDown))

func _on_Timer_timeout():
	count += 1
	get_node("CanvasLayer/Time").set_text(str("TIME\n", countDown - count))
