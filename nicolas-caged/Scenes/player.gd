extends Node2D
@export var speed:float = 200
@export var jump_base:float = 10
@export var jump_up:float = 100
@export var jump_pow:float = 1.001
@export var push_base_add = 50.
@export var floor_check:bool = true
var can_jump:bool = false
var x_vel:float = 0
var y_vel:float = 0
var move_input:Vector2 = Vector2.ZERO
func _ready():
	pass # Replace with function body.ddddddddddda
	
func _physics_process(delta):
	x_vel = $nico.linear_velocity.x
	y_vel = $nico.linear_velocity.y
	$nico.apply_force(move_input * speed,Vector2.ZERO)
	_debug_print()
	
func _debug_print():
	%lb_input.text = str(round(move_input.x))
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
		
	move_input.x = Input.get_axis("a","d")
	move_input.y = Input.get_axis("w","s")
	if Input.is_action_just_pressed("spc"):
		if !can_jump:return
		var impulse_x:float = pow(abs(x_vel),jump_pow)
		var impulse_y:float = jump_base * move_input.y  * jump_up
		var impulse = Vector2(impulse_x,impulse_y)
		
		$nico.apply_impulse(Vector2(0,impulse.y * 1.25))
		$nico.apply_impulse(impulse * move_input * jump_base * 0.1 + (move_input*50))
		


func _on_floor_col_body_entered(body):
	if !floor_check:return
	if body.name=='cage':
		can_jump = true


func _on_floor_col_body_exited(body):
	if body.name=='cage':
		can_jump = false
		
	
 
