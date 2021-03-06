extends KinematicBody


# Declare member variables here. Examples:
var speed = 0
var max_speed = 50
var acceleration = .5
var velocity : Vector3 = Vector3(0,0,0)
var decelration = .25
var direction
var dead
var i_acel
var d_time


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	direction = Vector3.FORWARD
	d_time = 0

func _process(delta):
	if dead:
		d_time += delta
		if d_time > .75:
			get_tree().reload_current_scene()
		
			
	if Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene()
		

func _physics_process(delta):
	# Get inputs
	if !dead:
		i_acel = Input.get_action_strength("acel") - Input.get_action_strength("decel")
	else:
		i_acel = 0
	# accelerate meteor
	if i_acel > 0:
		speed += acceleration * i_acel
	elif i_acel < 0:
		speed += decelration * i_acel 
	if speed < 0:
		speed = 0
	if speed > max_speed:
		speed = max_speed
		
	# set direction
	velocity = direction * speed * delta
	
	
	# detect collision
	if move_and_collide(velocity):
		var e
		if !e:
			explode()
			e = true
		
	# look forward
	look_at(self.translation + (direction *10), Vector3.UP)
		
		
		
func explode():
	var explosion = load("res://vfx/Explosion.tscn")
	var e = explosion.instance()
	e.global_transform = self.global_transform
	get_node("/root/Spatial").add_child(e)
	var ouch = get_node("ouch")
	ouch.playing = true
	speed = 0
	dead = true
	


