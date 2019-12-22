<html>
<head>
  <title>CSC 471 Atmospheric Scattering on Procedurally Generated Sphere</title>

  <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,400,700,400italic,700italic" rel="stylesheet" type="text/css">

  <style>
    * {
      margin: 0;
      padding: 0;
    }

    body {
      background: white;
      color: #333333;
      -webkit-font-smoothing: antialiased;
      font-size: 16px;
      font-family: "Source Sans Pro", Helvetica;
    }

    img {
      display: inline-block;
    }

    em {
      font-size: 12px;
    }

    #signature {
      margin-left: 30px;
      font-style: oblique;
    }

    a:link,
    a:visited {
      color: #165788;
      text-decoration: none;
    }

    a:hover,
    a:focus,
    a:active {
      text-decoration: underline;
    }

    .wrapper {
      width: 660px;
      margin: auto;
    }

    .container {
      width: 660px;
      margin: auto;
    }

    #content {
      width: 650px;
      margin: 70px auto 0px auto;
    }

    #content article {
      margin-bottom: 150px;
    }

    #content h1,
    #content h2 {
      color: black;
      margin-bottom: 30px;
      font-weight: 200;
      font-size: 48px;
    }

    #content h3 {
      color: black;
      border-bottom: 1px solid black;
      text-transform: uppercase;
      margin: 30px 0px 30px 0px;
      font-size: 28px;
      font-weight: 200;
    }

    #content p {
      width: 100%;
      line-height: 150%;
      margin-bottom: 20px;
    }

    #content p:first-child {
      font-size: 18px;
      font-style: italic;
      letter-spacing: 2px;
    }

    #content p:first-child:first-line {
        font-weight: bold;
    }
  
    #content ul {
        padding-left:25px
    }

    pre {
      font-size: 10px;
      padding: 15px;
      border-radius: 10px;
      background: #ddd;
    }
  </style>
</head>

<body><div class="wrapper"><section id="content">

<h1>Atmospheric Scattering on Procedurally Generated Sphere</h1>

<h4>Dane Reimers</h4>

<article> <!-- This adds padding at the top and bottom -->




<h3>Project Description</h3>

<pThis project is an implementation of atmospheric scattering, using both Rayleigh and Mie scattering, on a procedurally generated landscape on a sphere.</p>

<!-- A Centered image-->
<center>
  <a>
    <img src="images/sunset.png" width="100%">
  </a>
  <em>Screenshot of final product</em>
</center>




<h3>Landscape</h3>
<p>I started the project by making the procedurally generated landscape on a sphere. To do this I started by rendering a large sphere centered at the origin. Then, with the vertex shader I used a noise function to scale the heights of the vertices along their normals to produce a terrain. I also used a dirt texture to make the terrain look more realistic and calculate the normals of each vertex by checking 2 close points to use in lighting the terrain.</p>
<center>
  <a>
    <img src="images/terrain.png" width="100%">
  </a>
  <em>Screenshot of the terrain with noise function in polygon mode</em>
</center>

<center>
  <a>
    <img src="images/terrain2.png" width="100%">
  </a>
  <em>Screenshot of the terrain</em>
</center>

<h3>Camera Movement</h3>
<p>Another aspect of the project was creating a camera class that would work well on my spherical world. To do this I kept track of the "up" vector (which was the normalized position) and "lookAt" vector of the camera. 
    Each movement call, I first rotated the lookAt vector around the up vector by the amount of rotation from keyboard input. 
    Then, I calculated the cross product of the up vector and the lookAt vector to find a vector to use to create a rotation matrix that would move the camera in the direction of the lookAt vector. 
    Doing this created a camera that can look around the world and move in the direction it is facing, always staying at the planets surface.</p>
<center>
  <a>
    <img src="images/cameraVectors.png" width="50%">
  </a>
  <br>
  <em>Visual representation of camera vectors</em>
</center>


<center>
  <a>
    <video width=100% controls>
      <source src="images/camera.mp4" type="video/mp4">
    </video>
  </a>
  <em>Demo of camera movement</em>
</center>
</center>

<h3>Atmospheric Scattering</h3>
<p>The last part of the project was to implement atmospheric scattering to create the sky for my world. 
    To create the effect I used a combination of Rayleigh and Mie scattering.
    Rayleigh scattering is the scattering of light waves by particles much smaller than the wavelength and produces the 
    blue color of the sky during the day and the orange/red at sunset. Mie scattering is the scattering of light by particles of
    similar or greater size than the wavelength (ex. aerosols) and produces the glow around the sun.
    You can read more about these effects <a href="https://developer.nvidia.com/gpugems/GPUGems2/gpugems2_chapter16.html">here</a>.
    First, I rendered another sphere centered at the origin that contained the planet sphere. 
    Then, I refactored code from <a href="https://github.com/wwwtyro/glsl-atmosphere">here</a> to perform the scattering on the outer sphere.
    I also added stars to the night sky by linearly interpolating between the atmospheric scattering and an image of stars.
</p>

<center>
<h4>Examples of only Mie Scattering</h4>
  <a>
    <img src="images/mie1.png" width="49%"/>
    <img src="images/mie2.png" width="49%"/>
  </a>
</center>

<center>
<h4>Examples of only Rayleigh Scattering</h4>
  <a>
    <img src="images/rayleigh1.png" width="49%"/>
    <img src="images/rayleigh2.png" width="49%"/>
  </a>
</center>

<center>
<h4>Stars</h4>
  <a>
    <img src="images/stars.png" width="100%"/>
  </a>
</center>

<h3>Final Product</h3>
<p>Here are some demonstrations of the final product.</p>
<center>
  <a>
    <video width=100% controls>
      <source src="images/final1.mp4" type="video/mp4">
    </video>
  </a>
</center>

<br/>

<center>
  <a>
    <video width=100% controls>
      <source src="images/final2.mp4" type="video/mp4">
    </video>
  </a>
</center>

<center>
  <a>
    <video width=100% controls>
      <source src="images/final3.mp4" type="video/mp4">
    </video>
  </a>
</center>

<br/>

<h4>Functionality</h4>
  <ul>
    <li>A and D keys rotate the camera on a plane tangent to the planet.</li>
    <li>W and S keys move the camera forward and backward</li>
    <li>J and K keys adjust the camera height up and down</li>

<h3>Resources</h3>
<ul>
  <li>
    <a href="https://github.com/Dane-Reimers/AtmosScatteringOnProcGenWorld">Github Link</a>
  </li>
  <li>
    Contact Email: Dane.Reimers@gmail.com
  </li>
</ul>

</article></section></div></body></html>
