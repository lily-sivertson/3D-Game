extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func check_stat(h, v, i):
	var interacts= i
	var hero= h
	var villain= v
	if hero >=4:
		pass
	elif villain>= 4:
		pass
	elif Global.flour<=0:
		pass
	elif interacts>=4: 
		pass
