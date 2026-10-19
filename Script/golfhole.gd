extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer

func _on_body_entered(golfball: Node2D) -> void:
	golfball.queue_free()
	timer.start(3)
func _ready() -> void:
	animated_sprite_2d.play()
	


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scene/level_scene/start.tscn")
