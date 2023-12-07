extends Node


var storage=["Flour"]

var score=0
var health=100
var sanity=100

var san_req= 70
var tween

var body=""

var hero = 0
var villain = 0
var interacted= 0




# Called when the node enters the scene tree for the first time.
func _ready():
	#Input.mouse_mode=Input.MOUSE_MODE_VISIBLE
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if event.is_action_pressed("menu"):
		#var Inv=get_node_or_null("/root/Game/UI/Inv")
		#var HUD=get_node_or_null("/root/Game/UI/HUD")
		var Pause_menu = get_node_or_null("/root/Game/UI/Pause_menu")
		if Pause_menu==null:
			get_tree().quit()
		else: 
			
			if Pause_menu.visible:
				print("the pause menu is visible")
				Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
				get_tree().paused = false
				#HUD.show()
				#Pause_menu.global_position=Vector2(1152,576)
				Pause_menu.hide()
				
				
			else:
				print("njsfvndsfiv")
				Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
				get_tree().paused = true
				#Pause_menu.global_position=Vector2(0,0)
				#HUD.hide()
				Pause_menu.show()
		
func upd_score(s):
	score+= s
	var Score= get_node_or_null("/root/Game/UI/HUD/Score")
	if Score!=null:
		Score.text= "Score: "+ str(score)
	

		
func upd_health(h):
	health+=h
	"""var Health= get_node_or_null("/root/Game/UI/HUD/Health")
	if Score!=null:
		Score.text= "Score: "+ str(score)"""
		
		
func upd_sanity(s):
	print(sanity)
	sanity-=s
	var Sanity= get_node_or_null("/root/Game/UI/HUD/Sanity")
	if Sanity!=null:
		print("i am visible")
		Sanity.text= "Sanity: "+ str(sanity)
		if sanity<= 30:
			#make the text color red
			pass
		elif sanity<san_req:
			Sanity.visible=true
			
		
			
			
			
func pickup(n):
	var sound= get_node_or_null("/root/Game/Collect")
	var Inventory=get_node_or_null("/root/Game/UI/Inv")
	var flash=get_node_or_null("/root/Game/UI/Flash")
	var text=get_node_or_null("/root/Game/UI/Flash/text")
	sound.play()
	text.text=n
	flash.modulate.a=1.0
	flash.show()
	#flash.get_child(3).start
	Inventory.reset()
	tween=create_tween()
	tween.tween_property(flash, "modulate:a",.25,2)
	await(tween.finished)
	flash.hide()
	
func add_invi(n):
	storage.append(n)
	
func update_bod(bod):
	body=bod
	
func poof():
	body.queue_free()
	
func upd_ends(type):
	if type=="h":
		hero+=1
	elif type=="v":
		villain+=1
	interacted+=1
	Endings.check_stat(hero, villain, interacted)
	


	
	
