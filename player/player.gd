extends CharacterBody2D

class_name player

@onready var bulletScene : PackedScene = preload("res://player/player_bullet.tscn")
@export var lblNyawa : Label

@export var nyawa : int
# Called when the node enters the scene tree for the first time.
# Called every frame. 'delta' is the elapsed time since the previous frame.


func _process(delta):
	self.position = get_global_mouse_position()
	
	if Input.is_action_pressed("tembak") :
		shoot()
	

func getHit():
	nyawa -= 1
	if nyawa <= 0 :
		queue_free()

func shoot():
	var bullet = bulletScene.instantiate()
	bullet.position = self.position
	bullet.rotation = self.rotation
	bullet.speed = 100
	bullet.dir = Vector2(0, -10)
	get_parent().add_child(bullet)

func tertembak():
	nyawa -= 1
	if (lblNyawa == null):
		return
	lblNyawa.text = str(nyawa)
	if nyawa <= 0:
		self.queue_free()

