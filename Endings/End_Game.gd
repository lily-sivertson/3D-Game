extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/Label2.text= "Final score: "+ str(Global.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_quit_pressed():
	get_tree().quit()


func _on_main__menu_pressed():
	Global.restart()
	get_tree().change_scene_to_file("res://UI/Main_menu.tscn")
