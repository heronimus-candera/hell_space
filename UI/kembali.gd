extends Control

@export var menuUtama : VBoxContainer
# Called when the node enters the scene tree for the first time.


func _on_btn_kembali_pressed():
	get_parent().visible = false
	menuUtama.visible = true
