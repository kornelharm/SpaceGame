extends Spatial

export var acceleration = 1
export var decceleration = 0.75
export var rotational_acceleration = 0.3

var direction
var velocity = Vector3()

var right = Vector3()
var left = Vector3()
var back = Vector3()
var forward = Vector3()
var up = Vector3()
var down = Vector3()

func establish_directions():
	
	forward = -transform.basis.z
	back = transform.basis.z
	right = transform.basis.x
	left = -transform.basis.x
	up = transform.basis.y
	down = -transform.basis.y


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
	if(Input.is_action_pressed("move_up")):
		velocity += up * acceleration * delta
	if(Input.is_action_pressed("move_down")):
		velocity += down * acceleration * delta
		
	if(Input.is_action_pressed("yaw_left")):
		rotate_object_local(Vector3.UP, rotational_acceleration * delta)
	if(Input.is_action_pressed("yaw_right")):
		rotate_object_local(Vector3.DOWN, rotational_acceleration * delta)
		
	if(Input.is_action_pressed("roll_right")):
		rotate_object_local(Vector3.FORWARD, rotational_acceleration * delta)
	if(Input.is_action_pressed("roll_left")):
		rotate_object_local(Vector3.BACK, rotational_acceleration * delta)
		
	if(Input.is_action_pressed("pitch_up")):
		rotate_object_local(Vector3.LEFT, rotational_acceleration * delta)
	if(Input.is_action_pressed("pitch_down")):
		rotate_object_local(Vector3.RIGHT, rotational_acceleration * delta)
	
	# Velocity of the ship inline with the direction of the front
	var forward_velocity = velocity - velocity.project(forward)
	# Velocity of the ship not inline with the direction of the front
	var drift = velocity - forward_velocity
	
	if (drift.length() < 0.1):
		pass
		#velocity -= drift
#	else:
#		velocity -= drift.normalized() * delta * decceleration
	
	velocity -= velocity.normalized() * delta * decceleration
	
	move(delta)
	
		
		
