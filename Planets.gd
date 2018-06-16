extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	update()
	
func _draw():
	for child in get_children():
		var path = child.path
		for i in range(1, path.size()):
			var start = path[i - 1]
			var end = path[i]
			draw_line(start + position, end + position, Color(255, 0, 0), 1)


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
