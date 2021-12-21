extends Spatial

var box = preload("res://Box.tscn")
var n = 5

onready var player = find_node("Player")
onready var boxparent = find_node("BoxParent")

func _ready():
	for i in range(10):
		add_box(i)
	Global.distance = 0

func _physics_process(delta: float):
	var player_z = floor(-(player.translation.z + 2) / 4.2)
	if player_z > Global.distance:
		Global.distance = player_z

func _on_Timer_timeout():
	boxparent.get_child(0).queue_free()
	var csgbox = box.instance()
	add_box(n)
	n += 1
	
func add_box(number):
	var csgbox = box.instance()
	var z_pos = (number + 2) * -4.2
	csgbox.translation = Vector3(rand_range(-1, 1), -2, z_pos)
	boxparent.add_child(csgbox)
