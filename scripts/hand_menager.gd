extends Node
@export var cards = []
#add card loader with stacking on different levels

var card = preload("res://scenes/cards/card.tscn")
signal new_turn
signal enemies_package

func _ready():
	var instance = card.instantiate()
	instance.scale = Vector2(0.095,-0.095)
	instance.position = Vector2(515,515)
	add_child(instance)
	
	get_node('%Button').button_down.connect(_on_new_turn)
	
	for child in get_children():
		child.add_enemies(get_node('%Enemies').get_children())
		child.connect('card_played', _on_card_played)
		child.connect('enemies_request', _on_enemies_request)
	
	pass
	#add getting cards

	
func _on_new_turn():
	var instance = card.instantiate()
	instance.scale = Vector2(0.095,-0.095)
	instance.position = Vector2(515,515)
	for child in get_children():
		child.queue_free()
		remove_child(child)
		pass
	add_child(instance)
	instance.add_enemies(get_node('%Enemies').get_children())
	instance.connect('card_played', _on_card_played)
	emit_signal('new_turn')

func _on_card_played(child):
	
	child.queue_free()

func _on_enemies_request():
	emit_signal('enemies_package',get_node('%Enemies').get_children())

func draw_cards():
	#TODO
	pass
