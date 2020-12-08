extends Area2D


const speed = 150
var ySpeed = 0.05
var dragForce = 0.002

var vel : Vector2 = Vector2()
var Body



# Called when the node enters the scene tree for the first time.
func _ready():
	vel.x = 0
	vel.y = ySpeed * gravity 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	print(Body)
	ySpeed = ySpeed + dragForce
	vel.y = ySpeed * gravity 
	translate(vel)
	


func _on_Area2D_body_entered(body):
	Body = body
	
	if "Floor" in body.name:
		if(ySpeed > 0):
			
			ySpeed = -ySpeed/2
			
	else: if "Player" in body.name:
		get_parent().get_node("GUI/HBoxContainer/Counters/Gold/GoldCont/Background/Label")._add_gold(200)
		get_parent().get_node("Player").addGold(200)
		queue_free()
	
	


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
