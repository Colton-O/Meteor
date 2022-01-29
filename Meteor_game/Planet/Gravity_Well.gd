extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var meteor
var dist
var gravity = 0
var gravity_vector

# Called when the node enters the scene tree for the first time.
func _ready():
	meteor = get_parent().get_node("meteor_root/meteor")
	
func _physics_process(_delta):
	dist = self.translation.distance_to(meteor.translation)
	gravity_vector = (meteor.translation - self.translation) * -gravity
	gravity_vector = meteor.direction + gravity_vector
	meteor.direction = gravity_vector
	

	if dist < 10:
		gravity = .006
	else:
		gravity = 0
	

		
		
	
