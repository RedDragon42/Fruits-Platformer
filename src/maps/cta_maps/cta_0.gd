tool
extends Node2D

func _ready():
	var map_rect = $Map.get_used_rect();
	var x = map_rect.end.x  * 16;
	var y = map_rect.position.y * 16;
	$Camera2D.position = Vector2(x / 2, y / 2);
	get_tree().get_root().connect("size_changed", self, "_on_resize");

func _on_resize():
	var zoom = get_viewport_rect().size
	print(zoom)
#	$Camera2D.set_zoom(Vector2(zoom.x / 1024, zoom.y / 600));-

func fruit_collected():
	pass
#	$HUD.add_fruit();
