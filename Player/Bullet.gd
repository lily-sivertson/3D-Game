extends Area3D

var damage=10
var speed=10
var velocity=Vector3.ZERO
var direction=Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if direction!= Vector3.ZERO:
		velocity=direction*speed
		
		global_position+=velocity



func _on_body_entered(body):
	if body.has_method("damage"):
		body.damage(damage)


func _on_timer_timeout():
	queue_free()
	
func set_direction(d):
	direction=d
	
func upd_pos(p):
	global_position=p
	

