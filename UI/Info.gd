extends Control


func _on_back_pressed():
	hide()


func _on_item_list_item_selected(index):
	for i in range(3):
		$Panel.get_child(i).hide()
		
	$Panel.get_child(index).show()
