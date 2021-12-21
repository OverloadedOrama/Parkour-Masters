extends MarginContainer

onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector
onready var distance_label = find_node("DistanceLabel")

var current_selection = 0

func _ready():
	set_current_selection(0)
	distance_label.text = "Distance: %s Blocks" % [Global.distance]

func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 1:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)

func handle_selection(_current_selection):
	if _current_selection == 0:
		get_tree().change_scene("res://Level.tscn")
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	elif current_selection == 1:
		get_tree().change_scene("res://MainMenu.tscn")
		get_tree().paused = false

func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	if _current_selection == 0:
		selector_one.text = ">"
	elif _current_selection == 1:
		selector_two.text = ">"
