extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bt_retry_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_bt_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.