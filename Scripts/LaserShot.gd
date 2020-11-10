extends Area2D

var damage : int = 1
var speed : int = -700
var velocity = Vector2()



func _physics_process(delta):
	velocity.y = speed * delta
	translate(velocity)
	$AnimatedSprite.play("Shoot")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
