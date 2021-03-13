extends Node2D

export(
	int, 
	"Level01", 
	"Level02"
) var sceneIndex = 0

var curScene = null
var bgMusics = [

]

var scenes = [
	preload("res://scene/Level1.tscn"),
	preload("res://scene/Level2.tscn")
]

# Called when the node enters the scene tree for the first time.
func _ready():
	# Loads the first level
	loadScene( sceneIndex ) 

func loadScene( index ):
	if curScene != null:
		curScene.queue_free()
	
	curScene = scenes[index].instance()
	self.add_child(curScene)