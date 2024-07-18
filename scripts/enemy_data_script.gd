extends Node2D

signal targeted(node)
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

func death():
	queue_free()
	pass
	
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
