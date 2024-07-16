extends Sprite2D

func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			print("finish him")
			play_card()
	elif get_rect().has_point((to_local(get_viewport().get_mouse_position()))):
		position.y = 485
	else:
		position.y = 515	
			
func play_card():
	get_parent().get_node('%enemy').visible = false
	queue_free()
	pass
	

