extends Control

@export var level : game

@onready var lblSkor = $VBoxContainer/lblSkor

func Skor(skor : String):
	lblSkor.text = skor

func _on_btn_menu_utama_pressed():
	level.lanjut()
	get_tree().change_scene_to_file("res://UI/menu_utama.tscn")
