extends Area
var init = false
func _ready():
	connect("body_entered", self, "on_body_enter")
	
func on_body_enter(body):
	if init:
		print ("yes")
	else:
		init = true




