shader_type canvas_item;

uniform float ringThickness = .075;
uniform float circleRadius = 0;
uniform float intensity = 0.5;

float distFromCenter(float x, float y) {
	float a = abs(.5 - x);
	float b = abs(.5 - y);
	return sqrt((a * a) + (b * b));
}

bool inCircle(float x, float y) {
	if (circleRadius <= 0.0)
		return false;
	if (distFromCenter(x, y) < circleRadius)
		return false;
	else if (distFromCenter(x, y) > circleRadius + ringThickness)
		return false;
	return true;
}

void fragment() {
	// Called for every pixel the material is visible on.
	COLOR = COLOR * ((!inCircle(UV.x, UV.y) ? 1.0 : intensity));
}