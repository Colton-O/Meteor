extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var meteor
var dist
var gravity = 0
var gravity_vector
var in_orbit = false

# Called when the node enters the scene tree for the first time.
func _ready():
	meteor = get_parent().get_node("meteor_root/meteor")
	
func _physics_process(_delta):
	dist = self.translation.distance_to(meteor.translation)
	gravity_vector = (meteor.translation - self.translation) * -gravity
	gravity_vector = meteor.direction + gravity_vector
	meteor.direction = gravity_vector
	

	if dist < 10:
		if in_orbit == false:
			orbit_set()
			
		gravity = .006
	else:
		gravity = 0
	

func orbit_set():
	in_orbit = true
	var orbit = get_parent().get_node("Orbit_count")
	orbit.global_transform = meteor.global_transform

	
	
	
	
	
	
