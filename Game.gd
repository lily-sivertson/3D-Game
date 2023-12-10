extends Node3D
var tween

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.upd_score(0)
	Global.upd_health(0)
	Global.upd_sanity(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_drain_body_entered(body):
	if body.name=="Player":
		tween=create_tween()
		Global.upd_score(10)
		tween.tween_property($UI/ColorRect, "modulate:a", 1, 1.5)
		await(tween.finished)
		get_tree().change_scene_to_file("res://map materials/Drain.tscn")
	
	





func _on_area_3d_mouse_entered():
	if Global.mapint==true:
		var Actions=get_node_or_null("/root/Game/UI/HUD/Actions")
		if Global.plug==false:
			Actions.text="Press [E] to plug drain"
			Global.upd_intobj("drain_plug")
		else:
			Actions.text="Press [E] to unplug drain"
			Global.upd_intobj("drain_unplug")

func _on_area_3d_mouse_exited():
	var Actions=get_node_or_null("/root/Game/UI/HUD/Actions")
	print("no actions")
	Actions.text="no actions available"


func _on_area_3d_area_entered(area):
	if area.get_parent().name=="Player":
		Global.upd_mapint(true)


func _on_area_3d_area_exited(area):
	if area.get_parent().name=="Player":
		Global.upd_mapint(false)


func _on_area_3d_body_entered(body):
	if body.name=="Player":
		var counter=get_node_or_null("/root/Game/map/Water/Timer")
		if counter!=null:
			counter.start()
		


func _on_timer_timeout():
	Global.upd_health(2)


func _on_area_3d_body_exited(body):
	if body.name=="Player":
		var counter=get_node_or_null("/root/Game/map/Water/Timer")
		if counter!=null:
			counter.stop()
