extends Control


@onready var menuPilih = $menuPilih
@onready var menuKredit = $menuKredit
@onready var menuAbout = $menuAbout
@onready var menuUtama = $VBoxContainer
@onready var menuTutorial = $menuTutorial

var tampak : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_btn_keluar_pressed():
	get_tree().quit()


func _on_btn_main_pressed():
	menuPilih.visible = true
	menuUtama.visible = false


func _on_btn_kredit_pressed():
	menuKredit.visible = true
	menuUtama.visible = false


func _on_btn_about_pressed():
	menuAbout.visible = true
	menuUtama.visible = false


func _on_btn_tutorial_pressed():
	menuTutorial.visible = true
	menuUtama.visible = false
