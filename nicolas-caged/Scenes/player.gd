extends Node2D
@export var w:bool = false
@export var a:bool = false
@export var speed:float = 200
@export var jump_punch:float = 500
var x_vel:float = 0
var y_vel:float = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.ddddddddddda
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	x_vel = $nico.linear_velocity.x
	y_vel = $nico.linear_velocity.y
	if w:
		$nico.apply_force(Vector2.RIGHT * speed,Vector2.ZERO)
	if a:
		$nico.apply_force(Vector2.LEFT * speed,Vector2.ZERO)
			
	pass
	_debug_print()
func _debug_print():
	#if floor(x_vel)>=1 or floor(x_vel)<= -1:
	if round(x_vel)==0:
		%lb_velocity_x.text = ""
	else:
		%lb_velocity_x.text = str(floor(x_vel))
	if round(y_vel)==0:
	#if floor(y_vel)>=1:
		%lb_velocity_y.text = ""
	else:
		%lb_velocity_y.text = str(floor(y_vel))
		
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
		$nico.apply_impulse(Vector2.UP * jump_punch)
		#$nico.apply_impulse(Vector2.RIGHT * 10,Vector2.ZERO)
		#$nico.apply_central_force(Vector2.RIGHT *100)
