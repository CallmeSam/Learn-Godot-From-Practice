extends Node

var currentScene = null
var playerName = "Mike"

func _ready():
	# Set the current scene to the last scene available
	currentScene = self.get_tree().get_root().get_child(self.get_tree().get_root().get_child_count() - 1)
	Globals.set("MAX_POWER_LEVEL", 9000)
	
func setScene(scene):
	print("I'm here")
	currentScene.queue_free()
	var s = ResourceLoader.load(scene)
	currentScene = s.instance()
	get_tree().get_root().add_child(currentScene)
	
func getPlayerName():
	return playerName
