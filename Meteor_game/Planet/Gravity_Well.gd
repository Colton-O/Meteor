extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var meteor
var dist
var gravity_cur = 0
var gravity_max = 0.003
var gravity_start = 20
var gravity_vector
var in_orbit = false
var orbit
var p_offset = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	meteor = get_parent().get_node("meteor_root/meteor")
	orbit = get_parent().get_node("Orbit")
	
func _physics_process(_delta):
	dist = self.translation.distance_to(meteor.translation)
	gravity_vector = (meteor.translation - self.translation) * -gravity_cur
	gravity_vector = meteor.direction + gravity_vector
	meteor.direction = gravity_vector

	if dist < gravity_start:
		if in_orbit == false:
			orbit_set()
		gravity_cur = gravity_max
	else:
		if(in_orbit):
			_spawn_planet()
			in_orbit = false
			orbit.init = false
		
		gravity_cur = 0
	

func orbit_set():
	in_orbit = true
	orbit.global_transform = meteor.global_transform

func _spawn_planet():
	var p_dist = 700
	var planet_pos = meteor.direction * 50
	var planet = load("res://Planet/Planet_01.tscn")

	match randi() % 3:
		0:
			planet = load("res://Planet/Planet_01.tscn")
		1:
			planet = load("res://Planet/Planet_02.tscn")
		2:
			planet = load("res://Planet/Planet_04.tscn")
			
	var p = planet.instance()
	var v = Vector2(meteor.direction.z, meteor.direction.y)
	var first_value = bool(randi() % 2)
	if first_value:
		p_offset = p_offset *-1
		
	var offset = Vector2(v.y, v.x) / sqrt ((v.y*v.y) + (v.x*v.x)) * p_offset
	p.translation = meteor.translation + planet_pos + Vector3(planet_pos.x, offset.y, offset.x)
	get_node("/root/Spatial").add_child(p)
	
