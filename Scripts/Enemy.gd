extends KinematicBody2D


const speed = 25
const ySpeed = 50

var shootingRate = randi()%100+50
var vel : Vector2 = Vector2()
var isDead = false
var goldAmountGiven = 10

const laserShot = preload("res://Scenes/enemyLaserShot.tscn")
const gui = preload("res://Scenes/GUI.tscn")
const cash = preload("res://Scenes/Cash.tscn")


func _ready():
	pass # Replace with function body.

func dead():
	#$CollisionShape2D.disabled = true
	var Cash = cash.instance()
	
	isDead = true
	get_parent().get_node("GUI/HBoxContainer/Counters/Gold/GoldCont/Background/Label")._add_gold(goldAmountGiven)
	$CollisionShape2D.queue_free()
	
	get_parent().get_node("Player").addGold(goldAmountGiven);
	get_parent().get_node("Player").killed += 1
	
	if(randi()%100+1 > 90):
		get_parent().add_child(Cash)
		Cash.position = $Position2D.global_position
	
	$AnimatedSprite.play("dead")
	
	$Timer.start()
	get_node("Particles2D").emitting = true
	

func _physics_process(delta):
	
	vel = Vector2()
	
	vel.x = 0
	vel.y = ySpeed
	vel = move_and_slide(vel)
	
	if(isDead == false):
		
		$AnimatedSprite.play("idle")
		
		shootingRate = shootingRate - 1
		
		if(shootingRate == 0):
			var laser = laserShot.instance()
			var laser2 = laserShot.instance()
			get_parent().add_child_below_node(get_child(1),laser)
			get_parent().add_child_below_node(get_child(1),laser2)
			laser.position = $Position2D.global_position
			laser2.position = $Position2D2.global_position
			shootingRate = randi()%100+1;


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Timer_timeout():
	queue_free()
