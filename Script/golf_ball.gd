extends RigidBody2D
@onready var guide_line : Line2D = $Line2D
@onready var raycast_down: RayCast2D = $"RayCast-down"
@onready var raycast_left: RayCast2D = $"RayCast-left"
@onready var raycast_up: RayCast2D = $"RayCast-up"
@onready var raycast_right: RayCast2D = $"RayCast-right"


var mouse_pos = null
var golf_pos = null
var speed = 200 #default base speed edit here if want to change all speed
var line_rotation = 0
var target = 0
var dragforce = 10
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_pos = get_global_mouse_position()
	golf_pos = get_global_position()

	#line_rotation is where line actualGGly look to cursor
	line_rotation = (rad_to_deg(get_angle_to(mouse_pos)))+90
	
	target = line_rotation+180
	guide_line.global_rotation_degrees = target
	print("Linear velo",get_linear_velocity())

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT and (linear_velocity <= Vector2(1.2,1.2) and linear_velocity >= Vector2(-1.2,-1.2)):
		#power is for distance calculate to how much force
		var distanceVec = abs((mouse_pos - golf_pos))
		var power = (distanceVec[0]**2)+(distanceVec[1]**2) 
		power = round(sqrt(power))
		print("power:",power)
		print("left mouse click Hit")
		print("angle: ",Vector2.from_angle(get_angle_to(mouse_pos)))
		apply_central_force(((Vector2.from_angle(get_angle_to(mouse_pos)))*speed*power*-1))
		print("Linear velo",get_linear_velocity())
