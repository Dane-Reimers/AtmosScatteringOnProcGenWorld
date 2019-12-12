#version 330 core
out vec4 color;
in vec3 vertex_normal;
in vec3 vertex_pos;
in vec2 vertex_tex;
uniform vec3 campos;

uniform sampler2D tex;
uniform sampler2D tex2;

void main()
{
vec3 n = normalize(vertex_normal);
vec3 lp=vec3(0, 1500, 0);
vec3 ld = normalize(vertex_pos - lp);
float diffuse = dot(n,-ld);
diffuse = clamp(diffuse, 0, 1);

color.rgb = texture(tex, vertex_tex * 25).rgb;

color.rgb *= diffuse*1.0;

color.a=1;

}
