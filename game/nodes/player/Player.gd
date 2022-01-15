extends KinematicBody

var velocity = Vector3.ZERO
var gravity = 100
func _physics_process(delta):
#	if Input.is_action_ just_pressed("jump") and is_on_floor():
#		velocity.y = 10

	velocity.y -= gravity *delta
	velocity = move_and_slide(velocity, Vector3.UP)
