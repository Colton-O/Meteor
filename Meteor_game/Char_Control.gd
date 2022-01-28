extends KinematicBody


# Declare member variables here. Examples:
var speed = 0
var acceleration = 1
var velocity : Vector3 = Vector3(0,0,0)
var decelrate = 1
var direction


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	direction = Vector3.FORWARD
	
func _physics_process(delta):
	acceleration = Input.get_action_strength("acel") - Input.get_action_strength("decel")
	if acceleration != 0:
		speed = 10 * acceleration
	else:
		speed = lerp(speed, 0, delta * decelrate)
		
		
	velocity = direction * speed
	velocity = move_and_slide(velocity, Vector3.UP)
