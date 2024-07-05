extends Sprite2D

var type = 'Goblin'
var healthPoints = 10

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
	
