extends Node2D
@export var w:bool = false
@export var a:bool = false
@export var speed:float = 200
@export var jump_punch:float = 500
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.






# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if w:
		$nico.apply_force(Vector2.RIGHT * speed,Vector2.ZERO)
	if a:
		$nico.apply_force(Vector2.LEFT * speed,Vector2.ZERO)
			
	pass

func _input(event):
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()
	if Input.is_action_just_pressed("f2"):
		get_tree().reload_current_scene()
		
	if Input.is_action_pressed("d"):
		w=true
	if Input.is_action_just_released("d"):
		w=false
	if Input.is_action_pressed("a"):
		a=true
	if Input.is_action_just_released("a"):
		a=false
		
	if Input.is_action_just_pressed("spc"):
		print('scpcdrfgdrgsdgtrs')
		$nico.apply_impulse(Vector2.UP * jump_punch)
		#$nico.apply_impulse(Vector2.RIGHT * 10,Vector2.ZERO)
		#$nico.apply_central_force(Vector2.RIGHT *100)
