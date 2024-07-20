extends Node2D

signal targeted(node)
signal end_of_fight
var type = 'Boblin'
var healthPoints = 10

#setup
func _ready():
	for card in get_parent().get_node('%player hand').get_children():
		card.connect('damage_request',_on_request_damage)
		pass
	get_parent().get_node('%player hand').connect('new_turn', _on_new_turn)

#target check
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		if get_node('Sprite2D').get_rect().has_point(to_local(event.position)) :#and card active
			print("enemy clicked")
			emit_signal('targeted',self)
			pass

#enemy specific
func activate_card():
	pass

func death(): #if enemy spawns something after death pay attention to commands order
	queue_free()
	print('asdfghb')
	if get_parent().get_children().size() == 1:
		print('end of fight')
		emit_signal('end_of_fight')
	
func _draw():
	#wstawia odpowiedniego sprita zależnie od type
	pass



#sygnały
func _on_request_damage(targets_list, dmgValue):
	if targets_list.find(self) != -1:
		healthPoints -= dmgValue
	
		if healthPoints <= 0:
			death()

func _on_new_turn():
	for child in get_parent().get_node('%player hand').get_children():
		child.connect('damage_request', _on_request_damage)
