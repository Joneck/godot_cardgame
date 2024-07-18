extends Sprite2D

var active = false
signal card_played
signal damage_request

func _ready(): #Add enemies as children of one node and make it more readable
		for enemy in get_parent().get_node('%Enemies').get_children():
			enemy.targeted.connect(_on_enemy_targeted)

func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_RIGHT:
		active = false
		return
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			active = true
			print("finish him")
			
	elif get_rect().has_point((to_local(get_viewport().get_mouse_position()))) or active:
		position.y = 485
	else:
		position.y = 515	



#Actually playing card
func play_card(enemy):
	emit_signal('damage_request',[enemy], 5)
	pass

func _on_enemy_targeted(enemy):
	if active:
		play_card(enemy)
		emit_signal('card_played',self)
		#add mana check
	pass
	

