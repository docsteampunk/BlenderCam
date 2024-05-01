@tool
class_name BlenderCamera
extends Camera3D
## Camera that has export values to convert Blender values to Godot properties

@export_category("Blender -> Godot Conversion")
@export var Convert: bool:
	set(value):
		convertToBlenderFOV(value)

@export_category("Inputs")
@export var blender_postion: Vector3
@export var blender_rotation: Vector3
@export var blender_FOV: float

@export_category("Convert Option")
@export var update_rotation: bool
@export var update_position: bool
@export var update_FOV: bool


func _ready():
	pass


func convertToBlenderFOV(isBlender):
	if !isBlender || !Engine.is_editor_hint():
		return
	
	if update_rotation:
		rotation = Vector3(blender_rotation.x, blender_rotation.z, -blender_rotation.y)
		rotation.x -= deg_to_rad(90)
	if update_position:
		position = Vector3(blender_postion.x, blender_postion.z, -blender_postion.y)
	if update_FOV:
		fov = (360/PI) * atan(tan(blender_FOV*PI/360)*9/16)
