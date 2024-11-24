extends Sprite2D
class_name MONKE

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.monke = self

func _go_to_player():
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(2.).timeout
	var tw:Tween = get_tree().create_tween()
	tw.tween_property(self,"position",Global.player.get_node("nico").global_position,3.)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "cage":
		Global._win()
		#get_tree().quit()
	pass # Replace with function body.
