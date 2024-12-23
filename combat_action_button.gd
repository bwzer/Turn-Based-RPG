extends Button

var combat_action : CombatAction


func _on_pressed() -> void:
	var node = get_node("/root/BattleScene")
	var aplayer = get_node("/root/BattleScene").chur_char.cast_combat_action(combat_action)
