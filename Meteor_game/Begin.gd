extends Node2D


# Declare member variables here. Examples:
var countdown = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	countdown -= delta
	if countdown < 0:
		get_tree().change_scene("res://level_01.tscn")
