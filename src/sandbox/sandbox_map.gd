extends Node2D

var camera_target : Node2D;

func _ready():
	_set_up_camera();
#	$Decorations/AnimationPlayer1.play("animation0");

func _process(_delta: float) -> void:
	$Camera2D.position = camera_target.position;

func _set_up_camera():
	var rect : Rect2 = $Map.get_used_rect();
	var camera : Camera2D = $Camera2D;
	camera.set_limit(0, rect.position.x * 16 + 16);
	camera.set_limit(1, rect.position.y * 16);
	camera.set_limit(2, rect.end.x * 16 - 16);
	camera.set_limit(3, rect.end.y * 16);
	camera_target = $Player;

func fruit_collected():
	pass
#	$HUD.add_fruit();
