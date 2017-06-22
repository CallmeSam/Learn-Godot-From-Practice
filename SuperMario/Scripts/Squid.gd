extends RigidBody2D


func _ready():
	pass


func _on_Area2D_body_enter( body ):
	if body.get_name() == "Mario":
		body.beingAttacked()
	else:
		pass
