extends Control

@export var pathFile : String
@export var pause : pause

#func _ready():
#
##	pathFile = pause.game

func _on_btn_ya_pressed():
	pindah()
	pause.paused()
	get_parent().visible = false
	get_tree().change_scene_to_file(pathFile)

func _on_btn_tidak_pressed():
	get_parent().visible = false
	pause.visible = true
#	print(get_tree())

func pindah():
	if pathFile == " ":
		pathFile = pause.game
		return
	else :
		return
