extends Node

@export var player_char : Character
@export var enemy_char : Character
var chur_char : Character

@export var next_turn_delay : float = 1.0

var game_over : bool = false

signal character_begin_turn(character)
signal character_end_turn(character)


func _ready() -> void:
	await get_tree().create_timer(0.5).timeout
	begin_next_turn()
	
func begin_next_turn():
	if chur_char == player_char:
		chur_char = enemy_char
	elif chur_char == enemy_char:
		chur_char = player_char
	else:
		chur_char = player_char
	
	character_begin_turn.emit(chur_char)
	
func end_current_turn():
	character_end_turn.emit(chur_char)
	
	await get_tree().create_timer(next_turn_delay).timeout
	
	if game_over == false:
		begin_next_turn()
		
func character_died(character):
	game_over = true
	
	if character.is_player == true:
		print("Game over")
	else:
		print("You Win!")
