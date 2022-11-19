extends ColorRect

export var mainGameScene : PackedScene


func _on_Button_button_up():
	get_tree().change_scense(mainGameScene.resource_path)
