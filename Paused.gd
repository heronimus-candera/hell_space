extends Control

class_name pause

@onready var konfirmasiUlang = $konfirmasiUlang
@onready var konfirmasiMenuUtama = $konfirmasiMenuUtama

@export var level : game
@export var game : String

func _on_btn_lanjut_pressed():
	level.lanjut()

func _on_btn_ulangi_pressed():
	self.visible = false
	konfirmasiUlang.visible = true

func _on_btn_menu_utama_pressed():
	self.visible = false
	konfirmasiMenuUtama.visible = true

func paused():
	level.lanjut()
