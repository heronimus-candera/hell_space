extends Node2D

class_name wave

@export var activated : bool = false

func _ready():
	active()

func active() -> void :
	for child in get_children() :
#		child.activated = true
		child.muncul()
