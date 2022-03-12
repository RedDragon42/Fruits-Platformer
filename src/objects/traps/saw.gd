extends Area2D


onready var anim : AnimatedSprite = $AnimatedSprite

func _ready():
	anim.play("on");
