extends Spatial


onready var camera = CameraController.new($Pivot)


func _ready():
	add_child(camera)
