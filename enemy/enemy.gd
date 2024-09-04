extends CharacterBody2D

@onready var bulletScene = preload("res://enemy/enemy_bullet.tscn")

@onready var putar : Node2D = $pemutar

@export var nyawa : int
@export var jumlahPeluru : int
@export var radius : int
@export var rotateSpeed : int

@export var posisi : int

@onready var shootTimer : Timer = $spawner

@onready var spawner = $spawner
@onready var pattern1 : Timer = $pattern1
@onready var pattern2 : Timer = $pattern2
@onready var pattern3 : Timer = $pattern3
@onready var pattern4 : Timer = $pattern4

#var new_rotation 
var time = Time.get_unix_time_from_system()
var seed : int = 56789 * time
var seed2 : int = 34567 * time

var s

func lcg(seed):
	return (1664525*seed + 1013904223) % 4294967296

# Called when the node enters the scene tree for the first time.
func _ready():
	shootTimer.stop()
	
	pattern1.stop()
	pattern2.stop()
	pattern3.stop()
	pattern4.stop()
	
	var step = 2 * PI / jumlahPeluru 
	
	for i in range(jumlahPeluru):
		var spawnPoint = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step * i)
		spawnPoint.position = pos
		spawnPoint.rotation = pos.angle()
		putar.add_child(spawnPoint)
	
#	pattern1.wait_time = 0.2
#	pattern1.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var new_rotation = putar.rotation_degrees + rotateSpeed * delta
	putar.rotation_degrees = fmod(new_rotation, 360)

func tertembak(impak):
	nyawa -= impak
	if nyawa <= 0 :
		self.queue_free()



func _on_pattern_1_timeout():
	rotateSpeed = 100
	for s in putar.get_children():
		var bullet = bulletScene.instantiate()
		get_tree().root.add_child(bullet)
		bullet.mode = false
		bullet.position = s.global_position
		bullet.rotation = s.global_rotation
		bullet.dir = Vector2(0, 2)
		


func _on_pattern_2_timeout():
	rotateSpeed = 0
	for s in putar.get_children():
		var bullet = bulletScene.instantiate()
		get_tree().root.add_child(bullet)
		bullet.mode = false
		bullet.position = s.global_position
		bullet.rotation = s.global_rotation
		bullet.dir = Vector2(0, 2)


func _on_pattern_3_timeout():
	rotateSpeed = lcg(seed)
	seed = rotateSpeed
	for s in putar.get_children():
		var bullet = bulletScene.instantiate()
		bullet.mode = false
		get_tree().root.add_child(bullet)
		bullet.position = s.global_position
		bullet.rotation = s.global_rotation
		bullet.dir = Vector2(0, 2)


func _on_pattern_4_timeout():
	rotateSpeed = 0
	for s in putar.get_children():
		var bullet = bulletScene.instantiate()
		get_tree().root.add_child(bullet)
		bullet.mode = true
		bullet.position = s.global_position
		bullet.rotation = s.global_rotation
		bullet.dir = Vector2(get_global_mouse_position().x - self.position.x, get_global_mouse_position().y - self.position.y).normalized()


func _on_spawner_timeout():
	seed2 = lcg(seed2)
	s = seed2 % 4
	if s == 0:
		pattern1.start()
		pattern2.stop()
		pattern3.stop()
		pattern4.stop()
	elif s == 1:
		pattern2.start()
		pattern1.stop()
		pattern3.stop()
		pattern4.stop()
	elif s == 2:
		pattern3.start()
		pattern1.stop()
		pattern2.stop()
		pattern4.stop()
	elif s == 3:
		pattern4.start()
		pattern1.stop()
		pattern3.stop()
		pattern2.stop()

func muncul():
	var tw = create_tween()
	tw.tween_property(self, "position", Vector2(self.position.x, posisi), 1).set_trans(Tween.TRANS_EXPO)
	await tw.finished
	$mulai.start()
	spawner.start()

func _on_mulai_timeout():
	seed2 = lcg(seed2)
	s = seed2 % 4
	if s == 0:
		pattern1.start()
		pattern2.stop()
		pattern3.stop()
		pattern4.stop()
	elif s == 1:
		pattern2.start()
		pattern1.stop()
		pattern3.stop()
		pattern4.stop()
	elif s == 2:
		pattern3.start()
		pattern1.stop()
		pattern2.stop()
		pattern4.stop()
	elif s == 3:
		pattern4.start()
		pattern1.stop()
		pattern3.stop()
		pattern2.stop()
