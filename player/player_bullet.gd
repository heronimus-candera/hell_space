extends Area2D

@export var dir : Vector2 = Vector2.ZERO
@export var speed : int = 50

func _physics_process(delta):
	self.position += dir.rotated(self.rotation) * delta * speed

func _on_body_entered(body):
	if body.is_in_group('enemies'):
		body.tertembak(5)
		self.queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	self.queue_free()
