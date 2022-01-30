extends Camera

var camPos: Vector3 = Vector3(0,0,0)
var camOffset: Vector3 = Vector3(10,5,-10)
var x = 10
var y = 5
var z = -10
var target
# Called when the node enters the scene tree for the first time.
func _ready():
	target = get_node("../meteor")


# Called every frame. 'delta' is the elapsed time since the previous frame
func _process(_delta):
	var t_pos = target.translation
	# var m_vel = target.velocity
	camPos = t_pos + camOffset * (1 + target.velocity.length())  #Vector3(t_pos.x + x, t_pos.y + y, t_pos.z + z)
	

	look_at_from_position(camPos, t_pos, Vector3.UP)
	
	
