extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://battle_scene.tscn")
