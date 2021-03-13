extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 500
const SPEED = 2

var motion = Vector2()

var start_x
var end_x
var exited = false

func _ready():
	start_x = self.position.x
	end_x = self.position.x - 200

	pass

func _process(delta):
	$Sprite.play("walking")

	if( self.position.x >= end_x ):
		motion.x -= 1
	else:
		motion.x += 1

	motion.y = GRAVITY
	motion = move_and_slide(motion, UP)

	# Delete Goomba when its exit the screen
	# And its away from Player
	if $"../Player":
		var distance = $"../Player".position.x - self.position.x
		if (distance > 300) and (exited == true):
			print("Delete Goomba")
			self.queue_free()


func _on_Visibility_screen_exited():
	exited = true
