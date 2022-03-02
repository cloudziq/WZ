extends Node
class_name CameraController


var pivot        : Spatial
var camera       : Camera
var camera_orbit := false
var camera_sens  := 0.25




func _init(node):
	pivot  = node
	camera = node.get_node("Camera")



func _physics_process(delta):
	if Input.is_action_pressed("camera_orbit"):
		camera_orbit = true
	else:
		camera_orbit = false


func _input(event):
	if event is InputEventMouseMotion and camera_orbit:
		pivot.rotate_y(deg2rad(-event.relative.x * camera_sens))
		camera.rotate_x(deg2rad(-event.relative.y * camera_sens))
		camera.rotation.x = clamp(camera.rotation.x, deg2rad(-80), deg2rad(80))
