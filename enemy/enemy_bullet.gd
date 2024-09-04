extends Area2D

@export var dir : Vector2 = Vector2.ZERO
@export var speed : int = 50
@export var mode : bool

func _process(delta):
	if mode :
		self.position += dir.rotated(self.rotation) * delta * speed
	else :
		position += transform.x * speed * delta


func _on_body_entered(body):
	if body.is_in_group('player'):
		body.tertembak()
		self.queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	self.queue_free()
