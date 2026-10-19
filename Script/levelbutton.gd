extends Button

var lvl = get_text()

func _on_button_down() -> void:
	get_tree().change_scene_to_file("res://scene/level_scene/Lv"+lvl+".tscn")
	
