extends CanvasLayer
@onready var restart_button = $RestartButton
@onready var game_over = $"Game over"

var twice = false

# Called when the node enters the scene tree for the first time.
func _ready():
	game_over.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_restart_button_pressed():
	if twice:
		return
	twice = true
	Progression.reset()
	WeaponManager.reset()
	await LevelTransition.fade_to_black(1)
	get_tree().change_scene_to_file("res://scenes/start_menu.tscn")
	await LevelTransition.fade_from_black(1)
