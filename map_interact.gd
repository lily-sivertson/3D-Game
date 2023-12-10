extends Node3D

var msg= "Enter Oven"
var panel
var actions= [
	{"name":"oven","phrase":"enter oven"},
	{"name":"sink handle", "phrase": "turn on water"},
	{"name":"calender","phrase":"look at calander"},
	{"name":"memo", "phrase": "look at memo board"},
	{"name":"oven_note", "phrase": "look at note"}
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

	
#for the oven

func _on_area_3d_mouse_entered():
	if Global.mapint==true:
		'''panel=get_node_or_null("/root/Game/panels/Oven_int")
		if panel!=null:
			panel.show()'''
		var Actions=get_node_or_null("/root/Game/UI/HUD/Actions")
		if Global.in_oven==false:
			Actions.text="Press [E] to enter oven"
			Global.upd_mapint(true)
			Global.upd_intobj("oven")
		else:
			Actions.text="Press [E] to exit oven"
			Global.upd_mapint(true)
			Global.upd_intobj("floor")

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


#sink

func _on_sink_handle_mouse_entered():
	if Global.mapint==true:
		var Actions=get_node_or_null("/root/Game/UI/HUD/Actions")
		if Global.water_run==false:
			Actions.text="Press [E] turn on water"
			Global.upd_intobj("water_on")
		else:
			Actions.text="Press [E] turn off water"
			Global.upd_intobj("water_off")

func _on_sink_handle_mouse_exited():
	var Actions=get_node_or_null("/root/Game/UI/HUD/Actions")
	print("no actions")
	Actions.text="no actions available"

func _on_sink_handle_area_entered(area):
	if area.get_parent().name=="Player":
		Global.upd_mapint(true)

func _on_sink_handle_area_exited(area):
	if area.get_parent().name=="Player":
		Global.upd_mapint(false)
		




func _on_calendar_open_mouse_entered():
	if Global.mapint==true:
		var Actions=get_node_or_null("/root/Game/UI/HUD/Actions")
		Actions.text="Press [E] to view calendar"
		Global.upd_mapint(true)
		Global.upd_intobj("calendar")


func _on_calendar_open_mouse_exited():
	var Actions=get_node_or_null("/root/Game/UI/HUD/Actions")
	Actions.text="no actions available"

func _on_calendar_open_area_entered(area):
	if area.get_parent().name=="Player":
		Global.upd_mapint(true)


func _on_calendar_open_area_exited(area):
	if area.get_parent().name=="Player":
		Global.upd_mapint(false)
		
