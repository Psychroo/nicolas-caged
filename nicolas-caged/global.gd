extends Node
var has_bone:bool = false
var player:PLAYER = null
var ui_esc:Control = null
var monke:MONKE=null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _win():
	var winmenu = load("res://Scenes/ui/win_menu.tscn").instantiate()
	player.get_node("CanvasLayer").add_child(winmenu)
func _esc_pressed():
	if !ui_esc:
		ui_esc = load("res://Scenes/ui/esc_menu.tscn").instantiate()
		#get_parent().add_child(ui_esc)
		player.get_node("CanvasLayer").add_child(ui_esc)
	else:
		ui_esc.queue_free()
		ui_esc = null
	
func _change_scene(from,to):
	add_child(to)
	from.queue_free()
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
