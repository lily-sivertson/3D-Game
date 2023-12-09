extends Node


var storage=["Flour"]

var score=0
var health=100
var sanity=100

var san_req= 70 #the requirement before you can see the sanity counter
var tween

var body=""

var hero = 0 #how many people you ahev helped
var villain = 0 # How many people you killed
var interacted= 0 #how many people you ahev had a significant interactiong with
var int_obj="" # the name of the object you are interacting with
var mapint=false #controls whether or not we can interact with parts of the map


var water_run=false # whether or not the sink water is running
var plug=false


# Called when the node enters the scene tree for the first time.
func _ready():
	#Input.mouse_mode=Input.MOUSE_MODE_VISIBLE
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if event.is_action_pressed("menu"):
		var Pause_menu = get_node_or_null("/root/Game/UI/Pause_menu")
		if Pause_menu==null:
			get_tree().quit()
		else: 
			
			if Pause_menu.visible:
				print("the pause menu is visible")
				Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
				get_tree().paused = false
				Pause_menu.hide()
				
				
			else:
				print("njsfvndsfiv")
				Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
				get_tree().paused = true
				Pause_menu.show()
	if event.is_action_pressed("interact") and mapint==true:
		var screen= get_node_or_null("/root/Game/UI/ColorRect")
		if screen!=null:
			screen.modulate.a=0
		if int_obj=="oven":
			#transit()
			tween=create_tween()
			tween.tween_property(screen, "modulate:a", 1, 1.5)
			await(tween.finished)	
			#await(transit().finished)
			#get_tree().change_scene_to_file("Res://map materials/Oven.tscn")
			var player= get_node_or_null("/root/Game/Player")
			if player!=null: 
				player.global_position= Vector3(26.007,10.539,-13.87)
		if int_obj=="floor":
			tween=create_tween()
			tween.tween_property(screen, "modulate:a", 1, 1.5)
			await(tween.finished)	
			var player= get_node_or_null("/root/Game/Player")
			if player!=null: 
				player.global_position= Vector3(21.913,.845,-10.08)
		if int_obj=="water_off":
			var stream=get_node_or_null("/root/Game/map/Stream")
			if stream!=null:
				stream.hide()
				water_run=true
		if int_obj=="water_on":
			var stream=get_node_or_null("/root/Game/map/Stream")
			if stream!=null:
				stream.show()
				water_run=false
				
		if int_obj=="calendar":
			pass
		if int_obj=="drain_plug":
			pass
		if int_obj=="drain_unplug":
			pass
		screen.modulate.a=0
		int_obj=""
func transit():
	var screen= get_node_or_null("/root/Game/UI/ColorRect")
	if screen!=null:
		screen.modulate.a=0
	tween=create_tween()
	tween.tween_property(screen, "modulate:a", 1, 1.5)
	await(tween.finished)	


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
			
		
			
			
			
func pickup(n):  # pick up items
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
	
func add_invi(n): #add items to the inventory
	storage.append(n)
	
func update_bod(bod): 
	body=bod
	
func poof(): # get rid of characters after they die
	body.queue_free()
	
func upd_ends(type): #updates your status on the endings to make sure that the game will end right
	if type=="h":
		hero+=1
	elif type=="v":
		villain+=1
	interacted+=1
	Endings.check_stat(hero, villain, interacted)
	

func upd_mapint(b):
	mapint=b
	
func upd_intobj(o):
	int_obj=o
