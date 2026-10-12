extends RigidBody2D
@onready var guide_line : Line2D = $Line2D


var mouse_pos = null
var golf_pos = null
var speed = 10.0
var line_rotation = 0
var target = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_pos = get_global_mouse_position()
	golf_pos = get_global_position()
	print("Mouse Position now is At: ",mouse_pos)
	print("Golf Position now is At: ",golf_pos)
	#line_rotation is where line actualGGly look to cursor
	line_rotation = (rad_to_deg(get_angle_to(mouse_pos)))+90
	#
	target = line_rotation+180
	guide_line.global_rotation_degrees = target
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			print("Wow, a left mouse click")
