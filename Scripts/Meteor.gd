extends Area2D

const speed = 150
const ySpeed = 50
var vel : Vector2 = Vector2()


func _ready():
	vel.x = rand_range(-2,2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	
	vel.y = speed *delta
	translate(vel)
	

func _on_KinematicBody2D_body_entered(body):
	if "Enemy" in body.name:
		$CollisionShape2D.disabled = true
	else:
		$CollisionShape2D.disabled = false
		get_parent().get_node("Player").gotHit(10)
		


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
