extends Camera

# Used for camera rotations
onready var pivotv = get_parent()
onready var pivoth = pivotv.get_parent()

var camera_lock = true
var camera_sensitivity = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
func _input(event):
	# If camera is unlocked
	if(Input.is_action_pressed("camera_unlock")):
		camera_lock = false
		if(event is InputEventMouseMotion):
			pivoth.rotate_y(-event.relative.x * camera_sensitivity * 0.004)
			pivotv.rotate_x(-event.relative.y * camera_sensitivity * 0.004)
			pivotv.rotation_degrees.x = clamp(pivotv.rotation_degrees.x, -80, 80)
	else:
		camera_lock = true
