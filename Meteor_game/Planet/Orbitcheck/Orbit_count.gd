extends Area
var init = false
var score = 0
var score_text
func _ready():
	connect("body_entered", self, "on_body_enter")
	score_text = get_node("../Score")
	score_text.text = "orbits: " + str(score)
	
func on_body_enter(body):
	if init:
		score += 1
		score_text.text = "orbits: " + str(score)
		var part = get_node("WIn")
		part.global_transform = body.global_transform
		part.emitting = true
	else:
		init = true




