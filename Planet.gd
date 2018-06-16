extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var velocity = Vector2(0, 100)
var acceleration = Vector2(0, 0)  
export var mass = 1

const SUN_MASS = 100000
const GRAV_CONST = 100

var path = []
const PATH_COLOR = PoolColorArray([Color(1.0, 0.0, 0.0)])

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func force():
	var val = (GRAV_CONST * mass * SUN_MASS) / position.length_squared()
	var dir = -position.normalized()
	
	return dir * val
	
func _physics_process(delta):
	position = position + velocity * delta
	acceleration = force() / mass;
	velocity += delta * acceleration;

	path.append(position)
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
