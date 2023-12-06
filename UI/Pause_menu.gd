extends Control


func _on_main_menu_pressed():
	get_tree().paused=false
	get_tree().change_scene_to_file("res://UI/Main_menu.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_back_pressed():
	hide()
	get_tree().paused=false
