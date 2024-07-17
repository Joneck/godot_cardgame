extends Sprite2D

var active = false

func _ready():
		get_parent().get_node('%enemy').targeted.connect(_on_enemy_targeted)
		get_parent().get_node('%enemy2').targeted.connect(_on_enemy_targeted)

func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_RIGHT:
		active = false
		return
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			active = true
			print("finish him")
			#cośtam sygnał trzeba sprawdzić
			
	elif get_rect().has_point((to_local(get_viewport().get_mouse_position()))) or active:
		position.y = 485
	else:
		position.y = 515	
			
func play_card():
	queue_free()
	pass
	
func _on_enemy_targeted(enemy):
	if active:
		enemy.visible = false
		play_card()
	pass
	

