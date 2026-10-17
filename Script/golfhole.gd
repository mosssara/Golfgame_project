extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _on_body_entered(golfball: Node2D) -> void:
	golfball.queue_free()
func _ready() -> void:
	animated_sprite_2d.play()
	
