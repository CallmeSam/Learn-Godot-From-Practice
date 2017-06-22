extends Node

export var countDown = 400
var count = 0
var coinNum = 0
var timerNode = null
var timeNode = null
var coinNode = null

func _ready():
	timerNode = get_node("CanvasLayer/Timer")
	timerNode.start()
	timeNode = get_node("CanvasLayer/Time")
	timeNode.set_text(str("TIME\n", countDown))
	coinNode = get_node("CanvasLayer/Coin")


func _on_Timer_timeout():
	count += 1
	timeNode.set_text(str("TIME\n", countDown - count))
	coinNode.set_text("x%02d" % get_owner().get_owner().coinCollected)
