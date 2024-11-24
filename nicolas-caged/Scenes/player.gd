extends Node2D
class_name PLAYER
@export var speed:float = 200
@export var jump_base:float = 10
@export var jump_up:float = 100
@export var jump_pow:float = 1.001
@export var push_base_add = 50.
@export var floor_check:bool = true
@export var extra_jump_post_bone : float = 2.5
var nicollision_height=150
var input_blocked:=false
var can_jump:bool = false
var x_vel:float = 0
var y_vel:float = 0
var move_input:Vector2 = Vector2.ZERO
func _ready():
	Global.has_bone=false

	#$bone.hide()
	#%cs_bone.disabled = true
	Global.player = self
	#_toggle_bone_grabbed(false)
	pass # Replace w1.1ith function body.ddddddddddda
func _toggle_bone_grabbed(bgrabbed:bool):
	var b:RigidBody2D = load("res://Scenes/bone_rigid.tscn").instantiate()
	b.global_position = %bone_point.global_position
	add_child(b)
	b.global_position = %bone_point.global_position
	Global.has_bone = true
	#if !bgrabbed:
		#$bone.hide()
		#%cs_bone.disabled = true
	#else:
		#$bone.global_position = %bone_point.global_position
		#$bone.show()
		#%cs_bone.disabled = false
		
func _physics_process(delta):
	$nico/overlay/up.visible = round(move_input.y) < 0
	$nico/overlay/right.visible = round(move_input.x) > 0
	$nico/overlay/left.visible = round(move_input.x) < 0
	#$nico/overlay/.visible = bool(round(move_input.y))
	#$nico/overlay/right.visible = bool(round(move_input.x))
	#$nico/overlay/up.visible = bool(round(move_input.y))
	x_vel = $nico.linear_velocity.x
	y_vel = $nico.linear_velocity.y
	if abs(x_vel) > 20:
		if $AnimationPlayer.current_animation != "walk":
			$AnimationPlayer.play("walk")
	else:
		if $AnimationPlayer.current_animation != "idle":
			$AnimationPlayer.play("idle")
		
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
	if input_blocked:return
	if Input.is_action_just_pressed("esc"):
		Global._esc_pressed()
	if Input.is_action_just_pressed("f2"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("a"):
		%nico_sprite.flip_h = true
		%nico_air.flip_h = true
	if Input.is_action_just_pressed("d"):
		%nico_sprite.flip_h = false
		%nico_air.flip_h = false
	move_input.x = Input.get_axis("a","d")
	move_input.y = Input.get_axis("w","s")
	if Input.is_action_just_pressed("spc"):
		if !can_jump:return
		var impulse_x:float = pow(abs(x_vel),jump_pow)
		var impulse_y:float = jump_base * move_input.y  * jump_up
		if Global.has_bone:
			impulse_y *= extra_jump_post_bone
		var impulse = Vector2(impulse_x,impulse_y)
		
		$nico.apply_impulse(Vector2(0,impulse.y * 1.25))
		$nico.apply_impulse(impulse * move_input * jump_base * 0.1 + (move_input*50))
		


func _on_floor_col_body_entered(body):
	if !floor_check:return
	if body.name=='cage':
	#if body.get_class()=='TileMap':
		can_jump = true
		%nicollision.shape.height = 150
		%nico_sprite.show()
		%nico_air.hide()

func _on_floor_col_body_exited(body):
	#if body.get_class()=='TileMap':
	if body.name=='cage':
		%nico_sprite.hide()
		%nico_air.show()
		%nicollision.shape.height = 80
		can_jump = false
		
	
 


func _on_checker_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	
	if body.get_class()=="TileMap":
		if $nico.linear_velocity.length() > 200:
			%audio.stream  = load("res://sound/GolpeArenaLargo.mp3")
			%audio.play()
			return
		if y_vel > 150:
			%audio.stream  = load("res://sound/GolpeArenaLargo.mp3")
			%audio.play()
			
		print("body shape entered ",body, " with velocity ",$nico.linear_velocity.length())
	pass # Replace with function body.
