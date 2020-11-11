extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const enemy = preload("res://Scenes/Enemy.tscn")
var spawnPosition : Vector2 = Vector2()
var spawnRate = 100;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	spawnRate = spawnRate-1
	if (spawnRate == 0):
		for n in range(1,7):
			var Enemy = enemy.instance()
			spawnPosition = Vector2()
			add_child_below_node(get_child(1),Enemy)
			spawnPosition.y = 0
			spawnPosition.x = n * 100
			Enemy.position = spawnPosition
			spawnRate = 100
