extends RigidBody2D

@onready var timer: Timer = $Timer
@onready var aimline: Line2D = $Aimline
@onready var timer_2: Timer = $Timer2


var mouse_pos = null
var golf_pos = null
var speed = 100 #default base speed edit here if want to change all speed
var line_rotation = 0
var target = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_pos = get_global_mouse_position()
	golf_pos = get_global_position()

	#line_rotation is where line actualGGly look to cursor
	line_rotation = (rad_to_deg(get_angle_to(mouse_pos)))+90
	
	target = line_rotation+180
	aimline.global_rotation_degrees = target
	print("Linear velo",get_linear_velocity())
	
	if linear_velocity != Vector2(0,0):
		aimline.hide()
	else:
		aimline.show()
	
	var distanceVec = abs((mouse_pos - golf_pos))
	var power = (distanceVec[0]**2)+(distanceVec[1]**2) 
	power = round(sqrt(power))
	power = power**1.3
	power = clampf(power,100,700)
	print("power: ",power)
	if power >= 100 and power <= 150:
		aimline.set_default_color(Color.AQUAMARINE)
		
	elif power >= 151 and power<= 350:
		aimline.set_default_color(Color.DARK_ORANGE)
		
	elif power >= 351 and power <= 600:
		aimline.set_default_color(Color.DARK_RED)
		
	elif power >= 601 and power <= 700:
		aimline.set_default_color(Color.CRIMSON)
		
	print(abs(linear_velocity))
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT and (linear_velocity == Vector2(0,0) ):
		#power is for distance calculate to how much force
		var distanceVec = abs((mouse_pos - golf_pos))
		var power = (distanceVec[0]**2)+(distanceVec[1]**2) 
		power = round(sqrt(power))
		power = power**1.3

		power = clampf(power,100,850)
		print("actual power:",power)
		print("angle: ",Vector2.from_angle(get_angle_to(mouse_pos)))
		apply_central_force(((Vector2.from_angle(get_angle_to(mouse_pos)))*speed*power*-1))
		print("Linear velo",get_linear_velocity())
		timer.start(0.75)
		
func _on_timer_timeout() -> void:
	print("timeout")
	if abs(linear_velocity[0]) <= 1.7 and abs(linear_velocity[1]) <= 1.7:
		timer_2.start(0.25)
		timer.stop()


func _on_timer_2_timeout() -> void:
	if abs(linear_velocity[0]) <= 1.7 and abs(linear_velocity[1]) <= 1.7:
		linear_velocity = Vector2(0,0)
