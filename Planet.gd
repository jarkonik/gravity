extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var velocity = Vector2(0, 0)

var acceleration = Vector2(0, 0)  
export var mass = 1
export var is_static = false
export var gravity_source = true
export var path_color = Color(1, 0, 0)

const GRAV_CONST = 20

var path = []
const PATH_COLOR = PoolColorArray([Color(1.0, 0.0, 0.0)])

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func object_force(object):
	if !object.gravity_source:
		return Vector2(0, 0)
	
	var distance_vec = position - object.position
	if distance_vec.length() <= 0:
		return Vector2(0, 0)
	
	var val = (GRAV_CONST * mass * object.mass) / distance_vec.length_squared()
	var dir = -distance_vec.normalized()
	
	return dir * val
	
func force():
	var siblings = get_parent().get_children()
	var force = Vector2(0, 0)
	for sibling in siblings:
		force += object_force(sibling)
	return force
	
func _physics_process(delta):
	if is_static:
		return

	acceleration = force() / mass;
	position += delta * (velocity + acceleration * delta / 2)
	var new_acceleration = force() / mass;
	velocity += delta * (acceleration + new_acceleration) / 2;

	if path.size() > 10000:
		path.pop_front()
	path.append(position)
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
