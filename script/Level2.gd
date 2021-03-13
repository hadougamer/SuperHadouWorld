extends Node2D

var pre_player=preload("res://scene/Player.tscn")
var player
var on_tube_exit=false

func _ready():
	player = pre_player.instance()
	player.global_position = $PlayerPosition.global_position
	player.z_index = 25
	
	add_child(player)

func _process(delta):
	if Input.is_action_pressed("ui_down"):
		if on_tube_exit == true:
			$"..".loadScene( 0 )	

func _on_TubeExit_body_entered(body):
	if body.is_in_group("player"):
		on_tube_exit = true

func _on_TubeExit_body_exited(body):
	if body.is_in_group("player"):
		on_tube_exit = false
