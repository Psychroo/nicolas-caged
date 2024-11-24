extends Area2D
#@export var id="bone"
#@export_file('sprite') var sprite
# Called when the node enters the scene tree for the first time.
func _ready():
	if name != 'i_bone':
		$bone.hide()
		$other.show()
	else:
		$bone.show()
		$other.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "cage":
		
		match name:
			'i_bone':
				Global.player.call_deferred("_toggle_bone_grabbed",true)
				
				queue_free()
				pass
			'i_dog':
				if Global.has_bone:
					get_tree().quit()
				pass
	pass # Replace with function body.
