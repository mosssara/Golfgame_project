extends Control
@onready var text_edit: TextEdit = $TextEdit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_position(Vector2(0,640))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var recieve_emit = get_tree().("golfball")
	recieve_emit.connect("hit")
	text_edit.text = str()
