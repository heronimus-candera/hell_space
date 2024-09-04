extends Node2D

class_name game

signal gameEnd
signal gameOver

@export var waving : Array[PackedScene]
@onready var pause = $paused
@onready var skor = $skor
@onready var gameover = $gameOver

var stop = true
var waktu = 0
var waveee = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	connect('gameEnd', on_gameEnd)
	connect("gameOver", on_gameOver)
#	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_tree().get_nodes_in_group('enemies').size() == 0 : 
		waves()
	if get_tree().get_first_node_in_group('player') == null:
		emit_signal("gameOver")
	waktu = float(waktu) + delta
	

func waves() -> void :
	if waveee >= len(waving):
		emit_signal("gameEnd")
		return
	
	var wavee = waving[waveee].instantiate()
	if wavee is wave:
		add_child(wavee)
		wavee.activated = true
		wavee.active()
	waveee += 1

func paused():
	get_tree().paused = true
	pause.visible = true

func _on_button_pressed():
	paused()

func lanjut():
	get_tree().paused = false
	pause.visible = false

func on_gameEnd():
	get_tree().paused = true
	skor.visible = true
	$skor/skor.Skor($itemLevel/timeLabel.text)

func on_gameOver():
	get_tree().paused = true
	gameover.visible = true
