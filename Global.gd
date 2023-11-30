extends Node

var score=0
var health=100
var sanity=100

var san_req= 70




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("menu"):
		get_tree().quit()
		
func upd_score(s):
	score+= s
	var Score= get_node_or_null("/root/game/UI/HUD/Score")
	if Score!=null:
		Score.text= "Score: "+ str(score)
	

		
func upd_health(h):
	health+=h
	"""var Health= get_node_or_null("/root/game/UI/HUD/Health")
	if Score!=null:
		Score.text= "Score: "+ str(score)"""
		
		
func upd_sanity(s):
	sanity-=s
	var Sanity= get_node_or_null("/root/game/UI/HUD/Sanity")
	if Sanity!=null:
		Sanity.text= "Sanity: "+ str(sanity)
		if sanity<= 30:
			#make the text color red
			pass
		elif sanity<san_req:
			Sanity.visible=true
			
		
			
	
	
