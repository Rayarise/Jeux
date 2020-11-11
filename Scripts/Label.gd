extends Label




# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var currentGold = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func _add_gold(var amount):
	currentGold += amount
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = str(currentGold)
