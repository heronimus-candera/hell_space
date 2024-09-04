extends Control

@export var pathFile : String
@export var game : game

func _on_btn_ulang_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file(pathFile)


func _on_btn_menu_utama_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://UI/menu_utama.tscn")
