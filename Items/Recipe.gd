extends Area3D


func _on_body_entered(body):
	if body.name=="Player":
		Global.add_invi("Recipe")
		Global.pickup("Recipe")
		queue_free()
