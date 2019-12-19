Atmospheric Scattering on a Procedurally Generated World
========================================

Project Description
------------

For this project I implemented atmospheric scattering with Rayleigh and Mie scattering on a procedurally generated landscape on a sphere in C++ using OpenGL.

Landscape
------------

I started the project by making the procedurally generated landscape on a sphere. To do this I started by rendering a large sphere centered at the origin. Then, with the vertex shader I used a noise function to scale the heights of the vertices along their normals to produce a terrain. I also used a dirt texture to make the terrain look more realistic and calculate the normals of each vertex by checking 2 close points to use in lighting the terrain.

Camera Movement
--------

Another aspect of the project was creating a camera class that would work well on my spherical world. To do this I kept track of the "up" vector (which was the normalized position) and "lookAt" vector of the camera. Each movement call, I first rotated the lookAt vector around the up vector by the amount of rotation from keyboard input. Then, I calculated the cross product of the up vector and the lookAt vector to find a vector to use to create a rotation matrix that would move the camera in the direction of the lookAt vector. Doing this created a camera that can look around the world and move in the direction it is facing, always staying at the planets surface.

Atmospheric Scattering
-------

The last part of the project was to implement atmospheric scattering to create the sky for my world. To create the effect I used a combination of Rayleigh and Mie scattering. Rayleigh scattering is the scattering of light waves by particles much smaller than the wavelength and produces the blue color of the sky during the day and the orange/red at sunset. Mie scattering is the scattering of light by particles of similar or greater size than the wavelength (ex. aerosols) and produces the glow around the sun. You can read more about these effects [here]
(<https://developer.nvidia.com/gpugems/GPUGems2/gpugems2_chapter16.html>). First, I rendered another sphere centered at the origin that contained the planet sphere. Then, I refactored code from [here](<https://github.com/wwwtyro/glsl-atmosphere>) to perform the scattering on the outer sphere. I also added stars to the night sky by linearly interpolating between the atmospheric scattering and an image of stars.

Functionality
------------

A and D keys rotate the camera on a plane tangent to the planet
W and S keys move the camera forward and backward
J and K keys adjust the camera height up and down
