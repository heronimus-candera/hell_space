extends CharacterBody2D


@export var nyawa : int
@export var posisi : int

@onready var bulletScene : PackedScene = preload("res://enemy/enemy_bullet.tscn")
@onready var spawner = $spawner
@onready var marker = $Marker2D

# Called when the node enters the scene tree for the first time.
func _ready():
#	spawner.stop()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_spawner_timeout():
	var bullet = bulletScene.instantiate()
	bullet.position = self.position
	bullet.position.y += 40
	bullet.speed = 100
	bullet.mode = true
	bullet.dir = Vector2(get_global_mouse_position().x - self.position.x, get_global_mouse_position().y - self.position.y).normalized()
	get_parent().add_child(bullet)

func muncul():
	var tw = create_tween()
	tw.tween_property(self, "position", Vector2(self.position.x, posisi), 1).set_trans(Tween.TRANS_EXPO)
	await tw.finished
	spawner.start()

func tertembak(tembak : int):
	nyawa -= tembak
	
	if nyawa <= 0 :
		self.queue_free()
