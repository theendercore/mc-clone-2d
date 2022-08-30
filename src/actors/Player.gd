extends Actor


func _physics_process(delta: float) -> void:
	var is_jump_interrupted:= Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction:= get_direction()
	_velocity = calc_move_velocety(_velocity, direction, speed, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	
	

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-Input.get_action_strength("jump") if is_on_floor() and Input.is_action_just_pressed("jump") else 0.0
	)


func calc_move_velocety(linear_velocity:Vector2, direction: Vector2, speed: Vector2, is_jump_interrupted: bool) -> Vector2:
	var out: = linear_velocity
	out.x = speed.x * direction.x
	if direction.y != 0.0:
		out.y = speed.y * direction.y
	if is_jump_interrupted:
			out.y *=0.6
	return out

