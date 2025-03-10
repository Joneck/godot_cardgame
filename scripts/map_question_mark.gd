extends AnimatedSprite2D

var currentAnim = 'default'
var entered = false
var completed = false

func _ready():
	play('default')

func _on_mouse_entered():
	if not completed:
		currentAnim = 'hover_transition'
		play('hover_transition')

func _on_mouse_exited():
	if not completed:
		stop()
		currentAnim = 'default'
		play('default')
	print('mouse left')

func _on_animation_finished():
	if currentAnim == 'hover_transition':
		play("hover")
	elif currentAnim == 'visited_transition':
		play('visited')


func _on_button_up():
	if not completed:
		entered = true
		var currentEvent = preload("res://scenes/fight_scene.tscn").instantiate()
		for child in get_tree().get_root().get_children():
			play("default")
			child.hide()
		get_tree().get_root().add_child(currentEvent)
		print('test')
	
func _on_draw():
	if entered:
		completed = true
		stop()
		currentAnim = 'visited_transition'
		play('visited_transition')
		entered = false

