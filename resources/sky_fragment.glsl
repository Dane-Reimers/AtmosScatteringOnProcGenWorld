#version 330 core
out vec4 color;
in vec3 vertex_normal;
in vec3 vertex_pos;
in vec2 vertex_tex;
uniform vec3 campos;

uniform sampler2D tex;
uniform sampler2D tex2;

vec3 lightPos = vec3(0, -1100, 0);
void main()
{
	float light = dot(normalize(vertex_pos), normalize(lightPos));
	light = clamp(light, 0, 1);
	float dist = abs(distance(campos, vertex_pos));
	dist = dist / 650;
	dist = clamp(dist, 0, 1);
	dist = pow(dist, 1.001);
	color.rgb = vec3(1, 1, 1) * (pow(light, 800) * 0.75 + light * 0.5);
	color.rgb *= vec3(0.25 * dist, 0.5 * dist, 1.0 * dist);
	color.a = 1;
}
