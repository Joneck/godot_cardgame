extends Node2D

signal targeted(node)
var type = 'Boblin'
var healthPoints = 10

func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		if get_node('Sprite2D').get_rect().has_point(to_local(event.position)) :#and card active
			print("enemy clicked")
			emit_signal('targeted',self)
			pass

func activate_card():
	pass

func deal_damage(dmgValue):
	healthPoints -= dmgValue
	
	if healthPoints <= 0:
		death()

func death():
	queue_free()
	pass
	
func _draw():
	#wstawia odpowiedniego sprita zależnie od type
	pass
	
