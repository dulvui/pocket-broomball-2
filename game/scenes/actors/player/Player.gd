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
			
	# Movement using Input functions:
	var move := Vector2.ZERO
	move.x = Input.get_axis("ui_left", "ui_right")
	move.y = Input.get_axis("ui_up", "ui_down")
	
	move_and_slide(move * speed)
	look_at(ball.global_position)


func _on_ChargeDetector_body_entered(body):
	animation_player.play("Charge")


func _on_AnimatedSprite_animation_finished():
	animation_player.play("Idle")


func _on_ChargeDetector_body_exited(body):
	animation_player.play("Idle")
