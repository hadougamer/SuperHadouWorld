extends Node2D

var pre_player=preload("res://scene/Player.tscn")
var pre_goomba=preload("res://scene/Goomba.tscn")

var player
var on_tube3 = false

func _ready():
	#$Audio.play()

	player = pre_player.instance()
	player.global_position = $PlayerPos.global_position
	player.z_index = 25

	# Add Goombas to Stage (according to their positions)
	var curGoomba = null
	for goombaPos in $GoombasPos.get_children():
		curGoomba = pre_goomba.instance()
		curGoomba.z_index = 25
		curGoomba.global_position = goombaPos.global_position
		
		add_child(curGoomba)
		
	add_child(player)

func _process(delta):
	if player:
		# Camera limits
		$Camera.limit_left = 0
		$Camera.limit_right = 6750
		$Camera.limit_bottom = 574
		
		# Updates camera according to player
		$Camera.position.y = player.position.y
		$Camera.position.x = player.position.x + 310

	if Input.is_action_pressed("ui_down"):
		if on_tube3 == true:
			$"..".loadScene( 1 )


func _on_AreaTube03_body_entered(body):
	if body.is_in_group("player"):
		on_tube3=true

func _on_AreaTube03_body_exited(body):
	if body.is_in_group("player"):
		on_tube3=false
