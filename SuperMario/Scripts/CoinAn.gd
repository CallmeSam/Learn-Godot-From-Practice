extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("Area2D").connect("body_enter", self, "_on_CoinAn_body_enter")

func _on_CoinAn_body_enter( body ):
	if body.get_name() == "Mario":
		body.addCoin()
		queue_free()
