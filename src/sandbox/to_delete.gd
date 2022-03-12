#tool
extends Node2D

onready var fruit_scene : PackedScene = preload("res://src/objects/fruit.tscn");

func _ready():
	pass
#	if Engine.editor_hint:
#		for fruit in get_children():
#			if fruit is Sprite:
#				return;
#			var new_fruit = fruit_scene.instance();
#			new_fruit.position = fruit.position
#			add_child(new_fruit);
#			fruit.queue_free()
