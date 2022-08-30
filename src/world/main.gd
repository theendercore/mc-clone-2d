extends Node2D

var Block = preload("res://src/tiles/Block.tscn")

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if event.is_action_released("mouse_right") and event.is_action_released("mouse_right") :
		var new_block = Block.instance()
		var new_pos: = get_local_mouse_position()
		new_block.position = new_pos
		print(new_block.position)
		get_node("World").add_child(new_block)
