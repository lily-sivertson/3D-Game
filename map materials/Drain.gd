extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.upd_score(0)
	Global.upd_health(0)
	Global.upd_sanity(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_3d_body_entered(body):
	if body.name=="Player":
		$Timer.start()
		print("player has entered")
	

	


func _on_timer_timeout():
	Global.upd_sanity(1)



func _on_area_3d_body_exited(body):
	if body.name=="Player":
		$Timer.stop()
