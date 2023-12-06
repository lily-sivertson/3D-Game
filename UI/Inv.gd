extends Control


#var storage= ["Flour"]
#needs to check what items the player has in their inventory and then show the appropriate information

func ready():
	pass
	
func _process(_delta):
	pass
	
func reset():
	print(Global.storage)
	$ItemList.clear()
	for s in Global.storage:
		for c in Catalouge.items:
			if s==c["name"]:
				$ItemList.add_item(c["name"],null,true)
	


func _on_item_list_item_selected(index):
	var iname=$ItemList.get_item_text(index)
	for i in Catalouge.items:
		if iname==i["name"]:
			$Item.text= iname
			$Description.text= i["desc"]
			
			
	pass
	


func _on_back_pressed():
	get_tree().paused=false
	hide()
	
