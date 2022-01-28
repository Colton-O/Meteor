extends Camera

var camPos: Vector3 = Vector3(0,0,0)
var x = 0
var y = 5
var z = 7
var target
# Called when the node enters the scene tree for the first time.
func _ready():
	target = get_node("../meteor")


# Called every frame. 'delta' is the elapsed time since the previous frame
func _process(_delta):
	var t_pos = target.translation
	var m_vel = target.velocity
	
	camPos = Vector3(t_pos.x + x, t_pos.y + y, t_pos.z + z)

	look_at_from_position(camPos, t_pos, Vector3.UP)
	
	
