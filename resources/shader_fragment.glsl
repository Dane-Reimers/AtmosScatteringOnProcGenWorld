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
float diffuse = dot(n,ld);

color.rgb = texture(tex, vertex_tex * .05).rgb;

color.rgb *= diffuse*0.9;

//vec3 cd = normalize(campos - vertex_pos);
//vec3 h = normalize(cd+ld);
//float spec = dot(n,h);
//spec = clamp(spec,0,1);
//spec = pow(spec,10);
//color.rgb += vec3(1,1,1)*spec*0.1;
color.a=1;



}
