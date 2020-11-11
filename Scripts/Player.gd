extends KinematicBody2D

var curHP : int = 100
var maxHP : int = 10
var moveSpeed : int = 500
var damage : int = 1
var multiplyer : int = 1

var curGold : int = 0

var isAlive = true
var curLvl : int = 0
var curXp : int = 0
var xpToNextLvl : int = 50
var xpToLvlIncreaseRate : float = 1.25

var interactDist : int = 70

var vel : Vector2 = Vector2()
var facingDir : Vector2 = Vector2()

const laserShot = preload("res://Scenes/LaserShot.tscn")

func addGold(amount):
	curGold += amount

func upgradeFire(var price):
	if(curGold >= price):
		multiplyer += 1
		curGold = curGold - price
		get_parent().get_node("GUI/HBoxContainer/Counters/Gold/GoldCont/Background/Label")._add_gold(-price)

func dead():
	queue_free()
	get_tree().paused = true
	get_parent().get_node("Label").text = "Gameover"

func gotHit(var hit):
	$AnimatedSprite.play("Hit")
	get_parent().get_node("GUI/HBoxContainer/Bars/Bar").removeLife(hit);
	curHP -= hit
	if(curHP <= 0):
		dead()

func _physics_process(delta):
	
	if(isAlive == true):
		
		
		vel = Vector2()
		var pos = get_position()
		#inputs
		
		if(Input.is_action_pressed("move_up")):
			vel.y -= 1
			facingDir = Vector2(0,-1)
			$AnimatedSprite.play("Thruster_on")
		else:
			$AnimatedSprite.play("idle")
		if(Input.is_action_pressed("move_down")):
			vel.y += 1
			facingDir = Vector2(0,1)
		if(Input.is_action_pressed("move_left")):
			vel.x -= 1
			facingDir = Vector2(-1,0)
		if(Input.is_action_pressed("move_right")):
			vel.x += 1
			facingDir = Vector2(1,0)
		if(Input.is_action_just_pressed("Fire")):
			var laser = laserShot.instance()
			var laser2 = laserShot.instance()
			laser.init(multiplyer)
			laser2.init(multiplyer)
			get_parent().add_child_below_node(get_child(1),laser)
			get_parent().add_child_below_node(get_child(1),laser2)
			laser.position = $Position2D.global_position
			laser2.position = $Position2D2.global_position
		
		vel = vel.normalized()
		
		move_and_slide(vel * moveSpeed)
		
	else:
		pass

