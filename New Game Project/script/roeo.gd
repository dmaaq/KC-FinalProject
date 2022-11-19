extends KinematicBody2D


onready var ray = $RayCast2D

var input = {
	'ui_up':Vector2.UP,
	'ui_down':Vector2.DOWN,
	'ui_left':Vector2.LEFT,
	'ui_right':Vector2.RIGHT,
}

func move(dir):
	var vectore_pos = input[dir] * 16 
	ray.cast_to = vectore_pos
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += vectore_pos
		return true
	return false
