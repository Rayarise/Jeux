extends KinematicBody2D

var curHP : int = 10
var maxHP : int = 10
var moveSpeed : int = 250
var damage : int = 1

var cash : int = 0

var curLvl : int = 0
var curXp : int = 0
var xpToNextLvl : int = 50
var xpToLvlIncreaseRate : float = 1.25

var interactDist : int = 70

var vel : Vector2 = Vector2()
var facingDir : Vector2 = Vector2()

const laserShot = preload("res://Scenes/LaserShot.tscn")

onready var rayCast = get_node("RayCast2D") 


func _physics_process(delta):
	
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
		get_parent().add_child(laser)
		get_parent().add_child(laser2)
		laser.position = $Position2D.global_position
		laser2.position = $Position2D2.global_position
	
	
	
	vel = vel.normalized()
	
	
	#move player

	move_and_slide(vel * moveSpeed)

