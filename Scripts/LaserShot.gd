extends Area2D

var damage : int = 1
var speed : int = -700
var velocity = Vector2()

var si = Vector2()
#var si_multiplyer = 2


func init(var si_multiplyer,var laserSpeed):
	si.x = si_multiplyer
	si.y = si_multiplyer
	
	$CollisionShape2D.scale = si
	scale = si
	
	speed = laserSpeed

func _physics_process(delta):
	velocity.y = speed * delta
	translate(velocity)
	$AnimatedSprite.play("Shoot")
	

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_LaserShot_body_entered(body):
	if "Enemy" in body.name:
		body.dead()
		queue_free()

func upgrade_bought():
	pass
