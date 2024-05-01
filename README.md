# BLENDERCAM
_For when you want to copy blender camera data without doing complex math._

You may be thinking to yourself, "Math? Why would I do math, can't I just plug in the values and it works?"

The short answer: 
  __No.__ 

The long answer: 
You need to convert the system from Z-up coordinates to Y-up cordinates. This is easily done by replacing the Z-axis and Y-axis values and inversing Y-axis... It's the cheapest solution that works.
```
[X,Y,Z] -> [X,Z,-Y]
```
The camera FOVs are different, Blender uses vertical scale FOV while Godot uses Horizontal. This majorly changes how we calculate it. This code was found by G-Brains on reddit and was resposted here: 

https://godotforums.org/d/22814-match-camera-blender-and-godot/7. 

The code looks like this:
```
Y = (360/pi)arctan(tan(Xpi/360)*9/16)
```
X is the Current FOV and Y is the Final FOV. We do this by:
* Divide 360 by PI to get 2PI radians, so we can do this without having to touch secant, cosecants, and cotangents.
* X is multipled with PI and divided by 360 to find the scaling factor in radians.
* Convert it to tangent so we can use arctangent to find out final scale.
* Multiply tan() with 9/16 to get opposite AXIS for FOV calculation.
* Use artangent to find the inverse of the tangent.
* Multiply by the 2PI radians to get it back to degrees.

Overall, it will add a UI at the top of the node "BlenderCam" that is just the regular cam but adds export values that allow you to add the values from Blender. Click the Convert boolean to convert from godot to blender.
