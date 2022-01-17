extends KinematicBody2D

class_name Player

onready var ball = get_parent().get_node("Ball");

export (NodePath) var joystickLeftPath
onready var joystickLeft : VirtualJoystick = get_node(joystickLeftPath)

export var speed : float = 200

var direction

var power = 10

var destination = null

var animation_player

func _ready():
	animation_player = $Body/AnimationPlayer
	direction = (ball.global_position - global_position).normalized()

func _physics_process(delta):
#	if destination != null:
#		direction = (destination - global_position).normalized()
#		var distance_to_player = global_position.distance_to(destination)
#		move_and_slide(direction * speed * distance_to_player)

	if joystickLeft and joystickLeft.is_pressed():
		position += joystickLeft.get_output() * speed * delta
		direction = joystickLeft.get_output().angle()
		look_at(direction)
		
	
	# Movement using Input functions:
	var move := Vector2.ZERO
	move.x = Input.get_axis("ui_left", "ui_right")
	move.y = Input.get_axis("ui_up", "ui_down")
	
	move_and_slide(move * speed)
	
#func _process(delta: float) -> void:
#	# Movement using the joystick output:

	
	# Rotation:


func _on_ChargeDetector_body_entered(body):
	animation_player.play("Charge")


func _on_AnimatedSprite_animation_finished():
	animation_player.play("Idle")


func _on_ChargeDetector_body_exited(body):
	animation_player.play("Idle")
