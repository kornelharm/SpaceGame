extends Spatial


var acceleration = 1

var direction
var velocity = Vector3()

var right = Vector3()
var left = Vector3()
var back = Vector3()
var forward = Vector3()

func establish_directions():
	forward = -transform.basis.z
	back = transform.basis.z
	right = transform.basis.x
	left = -transform.basis.x

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func move(delta):
	translation += velocity * delta

func _physics_process(delta):
	establish_directions()
	if(Input.is_action_pressed("move_forward")):
		velocity += forward * acceleration * delta
	if(Input.is_action_pressed("move_back")):
		velocity += back * acceleration * delta
	if(Input.is_action_pressed("move_left")):
		velocity += left * acceleration * delta
	if(Input.is_action_pressed("move_right")):
		velocity += right * acceleration * delta
		
	move(delta)
	
		
		
