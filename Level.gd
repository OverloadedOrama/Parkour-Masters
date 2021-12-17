extends Spatial

var box = preload("res://Box.tscn")
var n = 5

onready var player = find_node("Player")
onready var boxparent = find_node("BoxParent")

func _ready():
	for i in range(10):
		add_box(i)


func _on_Timer_timeout():
	boxparent.get_child(0).queue_free()
	var csgbox = box.instance()
	add_box(n)
	n += 1
	
func add_box(number):
	var csgbox = box.instance()
	var z_pos = (number + 2) * -4.2
	csgbox.translation = Vector3(rand_range(-2, 2), -1, z_pos)
	boxparent.add_child(csgbox)
