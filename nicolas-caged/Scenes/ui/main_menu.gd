extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bt_play_pressed():
	Global._change_scene(self,load("res://Scenes/phys_test_level.tscn").instantiate())

func _on_bt_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
