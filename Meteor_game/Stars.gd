extends Particles


# Declare member variables here. Examples:
# var a = 2
var meteor
var a = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	meteor = get_parent().get_node("meteor_root/meteor")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#self.translation = lerp(self.translation, meteor.translation, a * delta)

