extends KinematicBody2D

onready var ray = $RayCast2D

var input = {
	'ui_up':Vector2.UP,
	'ui_down':Vector2.DOWN,
	'ui_left':Vector2.LEFT,
	'ui_right':Vector2.RIGHT,
}

func _process(delta):
	$AnimationPlayer.play("idle")
	pass

func _unhandled_input(event):
	for dir in input.keys():
		if event.is_action_pressed(dir):
			move(dir)
		if event.is_action_pressed("restart"):
			get_tree().reload_current_scene()
	pass

func move(dir):
	var vectore_pos = input[dir] * 16
	ray.cast_to = vectore_pos
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += vectore_pos
	else:
		var collider = ray.get_collider()
		if collider.is_in_group("Box"):
			if collider.move(dir):
				position += vectore_pos

