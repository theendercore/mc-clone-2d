extends Area2D

func _input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("mouse_left"):
		queue_free()
