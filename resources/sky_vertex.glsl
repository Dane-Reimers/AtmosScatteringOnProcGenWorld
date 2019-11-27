#version 330 core

uniform mat4 ModelViewProjectionMatrix;
uniform vec3 v3CameraPos;     // The camera's current position

uniform vec3 v3LightDir;      // Direction vector to the light source

uniform vec3 v3InvWavelength; // 1 / pow(wavelength, 4) for RGB

uniform float fCameraHeight;    // The camera's current height

uniform float fCameraHeight2;   // fCameraHeight^2

uniform float fOuterRadius;     // The outer (atmosphere) radius

uniform float fOuterRadius2;    // fOuterRadius^2


uniform float fInnerRadius;     // The inner (planetary) radius

uniform float fInnerRadius2;    // fInnerRadius^2

uniform float fKrESun;          // Kr * ESun


uniform float fKmESun;          // Km * ESun

uniform float fKr4PI;           // Kr * 4 * PI

uniform float fKm4PI;           // Km * 4 * PI


uniform float fScale;           // 1 / (fOuterRadius - fInnerRadius)

uniform float fScaleOverScaleDepth; // fScale / fScaleDepth


void main()
{
	vec3 tpos1 = vertPos + normalize(vertPos) * height;
	vec4 tpos =  M * vec4(tpos1, 1.0);
	gl_Position = P * V * tpos;
}
