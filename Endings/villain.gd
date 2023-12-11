extends Node2D


func _on_ready():
	$Words.show()
	$sec1.start()
	
	


func play():

	
	$Yes.show()
	$No.show()
	$Yes.disabled=false
	$No.disabled=false
	
	
	



func _on_sec_1_timeout():
	$Words2.show()
	$sec2.start()


func _on_sec_2_timeout():
	$Words4.show()
	$sec3.start()


func _on_sec_3_timeout():
	$words11.show()
	$sec4.start()


func _on_sec_4_timeout():
	$Words5.show()
	$sec5.start()


func _on_yes_pressed():
	$Words6.queue_free()
	$Yes.queue_free()
	$No.queue_free()
	$Words7.queue_free()
	$Words8.show()
	$sec7.start()
	


func _on_no_pressed():
	$Words6.queue_free()
	$Yes.queue_free()
	$No.queue_free()
	$Words7.queue_free()
	$Words8.show()
	$sec9.start()
		



func _on_button_pressed():
	print("hello")
	play()


func _on_sec_5_timeout():
	$Words.queue_free()
	$Words2.queue_free()
	$Words11.queue_free()
	$Words5.queue_free()
	$Words4.queue_free()
	
	$Words12.show()
	$sec12.start()


func _on_sec_6_timeout():
	$Words7.show()
	$Yes.disabled=false
	$No.disabled=false
	$Yes.show()
	$No.show()
	
	
	


func _on_sec_7_timeout():
	$Words9.show()
	$sec8.start()


func _on_sec_8_timeout():
	get_tree().change_scene_to_file("res://Game.tscn")


func _on_sec_9_timeout():
	$Words10.show()
	$sec10.start()


func _on_sec_10_timeout():
	get_tree().change_scene_to_file("res://UI/Main_menu.tscn")



func _on_sec_12_timeout():
	$Words13.show()
	$sec13.start()


func _on_sec_13_timeout():
	$Words14.show()
	$sec14.start()


func _on_sec_14_timeout():
	$Words15.show()
	$sec15.start()


func _on_sec_15_timeout():
	$Words16.show()
	$sec16.start()


func _on_sec_16_timeout():
	get_tree().change_scene_to_file("res://Endings/End_Game.tscn")
