@tool
class_name BlenderCamera
extends Camera3D

@export_category("Blender -> Godot Conversion")
@export var Convert: bool:
	set(value):
		convertToBlenderFOV(value)
@export_category("Inputs")
@export var Postion: Vector3
@export var Rotation: Vector3
@export var FOV: float
@export_category("Convert Option")
@export var updateRotation: bool
@export var updatePosition: bool
@export var updateFOV: bool

func _ready():
	pass # Replace with function body.

func convertToBlenderFOV(isBlender):
	if (!isBlender || !Engine.is_editor_hint()):
		return
	
	if (updateRotation):
		rotation = Vector3(Rotation.x, Rotation.z, -Rotation.y)
		rotation.x -= deg_to_rad(90)
	if (updatePosition):
		position = Vector3(Postion.x, Postion.z, -Postion.y)
	if (updateFOV):
		print(FOV)
		fov = (360/PI) * atan(tan(FOV*PI/360)*9/16)
