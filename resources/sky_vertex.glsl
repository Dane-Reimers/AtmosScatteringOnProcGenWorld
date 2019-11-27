#version 330 core

layout(location = 0) in vec3 vertPos;
layout(location = 1) in vec3 vertNor;
layout(location = 2) in vec2 vertTex;

uniform mat4 P;
uniform mat4 V;
uniform mat4 M;
out vec3 vertex_pos;
out vec3 vertex_normal;
out vec2 vertex_tex;

void main()
{
	vec3 tpos1 = vertPos;
	vec4 tpos =  M * vec4(tpos1, 1.0);
	gl_Position = P * V * tpos;

	vertex_normal = vec4(M * vec4(normalize(vertPos),0.0)).xyz;
	vertex_pos = tpos.xyz;
	vertex_tex = vec2(vertex_normal.x / 2.0 + 0.5, vertex_normal.y / 2.0 + 0.5);
}
