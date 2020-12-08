extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const meteor = preload("res://Scenes/Meteor.tscn")
const enemy = preload("res://Scenes/Enemy.tscn")
var spawnPosition : Vector2 = Vector2()
var meteorSpawnPosition : Vector2 = Vector2()
var spawnRate = 100;
#var enemies = []
# Called when the node enters the scene tree for the first time.
# Enemy = [0,enemy.instance(),enemy.instance(),enemy.instance(),enemy.instance(),enemy.instance(),enemy.instance()]
func _ready():
	$SpawnRate.start()
	$MeteorSpawnRate.start()

func _physics_process(delta):
	#$SpawnRate.start()
	pass
	

func _on_SpawnRate_timeout():
	
	for n in range(1,7):
		var Enemy = [0,enemy.instance(),enemy.instance(),enemy.instance(),enemy.instance(),enemy.instance(),enemy.instance()]
		spawnPosition = Vector2()
		add_child_below_node(get_child(1),Enemy[n])
		spawnPosition.y = 0
		spawnPosition.x = n * 100
		Enemy[n].position = spawnPosition
		spawnRate = 100
		$SpawnRate.start()


func _on_MeteorSpawnRate_timeout():
	var Meteor = meteor.instance()
	meteorSpawnPosition = Vector2()
	add_child_below_node(get_child(1),Meteor)
	meteorSpawnPosition.y = -10
	meteorSpawnPosition.x = randi()%720+1
	Meteor.position = meteorSpawnPosition
	$MeteorSpawnRate.start()
	
