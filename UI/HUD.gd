extends Control


func ready():
	#Control.MOUSE_FILTER_PASS
	pass

	

func _on_pause_pressed():
	get_tree().paused=true
	var Pause_menu=get_node_or_null("/root/Game/UI/Pause_menu")
	Pause_menu.global_position=Vector2(0,0)
	Pause_menu.show()

func _on_inventory_pressed():
	get_tree().paused=true
	var Pause_menu=get_node_or_null("/root/Game/UI/Pause_menu")
	var Inventory=get_node_or_null("/root/Game/UI/Inv")
	
	Pause_menu.global_position=Vector2(1152,576)
	Inventory.reset()
	Inventory.show()



	
