extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var meteor
var dist
var gravity = 0
var gravity_vector
var in_orbit = false
var orbit

# Called when the node enters the scene tree for the first time.
func _ready():
	meteor = get_parent().get_node("meteor_root/meteor")
	orbit = get_parent().get_node("Orbit")
	
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
		if(in_orbit):
			_spawn_planet()
			in_orbit = false
			orbit.init = false
		
		gravity = 0
	

func orbit_set():
	in_orbit = true
	orbit.global_transform = meteor.global_transform

func _spawn_planet():
	var p_dist = 500
	var planet_pos = meteor.direction * 50
	var planet = load("res://Planet/Planet.tscn")
	var p = planet.instance()
	var v = Vector2(meteor.direction.z, meteor.direction.y)
	var offset = Vector2(v.y, v.x) / sqrt ((v.y*v.y) + (v.x*v.x)) * -10
	p.translation = meteor.translation + planet_pos + Vector3(planet_pos.x, offset.y, offset.x)
	p.scale = Vector3(3,3,3)
	get_node("/root/Spatial").add_child(p)
	
