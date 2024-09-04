shader_type canvas_item;

uniform float speed = .1;

void vertex() {
	// Place fragment code here.
	UV.y -= TIME * speed;
	UV.x += TIME * speed;
}
