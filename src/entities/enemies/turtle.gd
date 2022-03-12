extends KinematicBody2D

onready var anim : AnimatedSprite = $AnimatedSprite;

func _ready():
	anim.play("idle_no_spike")

