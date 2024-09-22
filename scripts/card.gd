extends Sprite2D

var active = false
signal card_played
signal damage_request
signal enemies_request

func _ready():
	pass

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

func add_enemies(en_list):
	var enemies = en_list
	for enemy in enemies:
		enemy.connect('targeted', _on_enemy_targeted)

#Actually playing card
func play_card(enemy):
	emit_signal('damage_request',[enemy], 5)
	send_card_flying(enemy.transform)
	pass

func _on_enemy_targeted(enemy):
	if active:
		play_card(enemy)
		emit_signal('card_played',self)
		#add mana check
	pass

func send_card_flying(target):
	print(target)
	pass

