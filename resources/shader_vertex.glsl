#version 330 core
float hash(float n) { return fract(sin(n) * 753.5453123); }
float snoise(vec3 x) {
	vec3 p = floor(x);
	vec3 f = fract(x);
	f = f * f * (3.0 - 2.0 * f);

	float n = p.x + p.y * 157.0 + 113.0 * p.z;
	return mix(mix(mix(hash(n + 0.0), hash(n + 1.0), f.x),
		mix(hash(n + 157.0), hash(n + 158.0), f.x), f.y),
		mix(mix(hash(n + 113.0), hash(n + 114.0), f.x),
			mix(hash(n + 270.0), hash(n + 271.0), f.x), f.y), f.z);
}
//Changing octaves, frequency and presistance results in a total different landscape.
float noise(vec3 position, int octaves, float frequency, float persistence) {
	float total = 0.0;
	float maxAmplitude = 0.0;
	float amplitude = 1.0;
	for (int i = 0; i < octaves; i++) {
		total += snoise(position * frequency) * amplitude;
		frequency *= 2.0;
		maxAmplitude += amplitude;
		amplitude *= persistence;
		}
	return total / maxAmplitude;
}

float calcNoise(vec3 position) {
	float height = noise(position, 11, 0.6, 0.7);
	float baseheight = noise(position, 4, 0.7, 0.8);
	baseheight = pow(baseheight, 5) * 3;
	height = baseheight*height;
	height *= 0.6;
	return height;
}

vec3 getNoisyPos(vec3 position) {
	float height = calcNoise(position);
	return position + normalize(position) * height;
}


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
   vec3 tpos1 = getNoisyPos(vertPos);
float theta = .1; 
    vec3 vecTangent = normalize(cross(tpos1, vec3(1.0, 0.0, 0.0))
     + cross(tpos1, vec3(0.0, 1.0, 0.0)));
    vec3 vecBitangent = normalize(cross(vecTangent, tpos1));
    vec3 ptTangentSample = getNoisyPos(normalize(tpos1 + theta * normalize(vecTangent)));
    vec3 ptBitangentSample = getNoisyPos(normalize(tpos1 + theta * normalize(vecBitangent)));

     vec3 vecNorm = normalize(cross(ptTangentSample - tpos1, ptBitangentSample - tpos1));

   

	vec4 tpos =  M * vec4(tpos1, 1.0);
	gl_Position = P * V * tpos;

	vertex_normal = normalize(vec4(M * vec4(vertPos,0.0)).xyz);
	vertex_tex = vertTex;
	vertex_normal = vecNorm;
	vertex_pos = tpos.xyz;
}
