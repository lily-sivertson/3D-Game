extends Control

#needs to check what items the player has in their inventory and then show the appropriate information

func ready():
	pass
	
func _process(delta):
	pass
	


func _on_item_list_item_selected(index):
	var iname=$ItemList.get_item_text(index)
	for i in Catalouge.items:
		if iname==i["name"]:
			$Item.text= iname
			$Description.text= i["desc"]
			
			
	pass
	
