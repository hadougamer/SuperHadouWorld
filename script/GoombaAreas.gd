extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_HeadGoomba_body_entered(body):
	if body.is_in_group("player"):
		print('Player on Goomba Head')
		$"../".queue_free()

func _on_BodyGoomba_body_entered(body):
	if body.is_in_group("player"):
		body.queue_free()
		
