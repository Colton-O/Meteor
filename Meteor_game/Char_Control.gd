extends KinematicBody


# Declare member variables here. Examples:
var speed = 10
var acelleration = 1
var velocity : Vector3 = Vector3(0,0,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(_delta):
	acelleration = Input.get_action_strength("acel") - Input.get_action_strength("decel")
	velocity = Vector3.FORWARD * acelleration * speed
	velocity = move_and_slide(velocity, Vector3.UP)
