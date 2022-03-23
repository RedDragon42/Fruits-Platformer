extends Node

onready var anim : AnimatedSprite = $AnimatedSprite;

var fruit : String = "cherries";

func _ready():
	anim.play(fruit);
	var _error = self.connect("body_entered", self, "_on_Area2D_body_entered")

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_node("/root/cta_0").fruit_collected();
		anim.play("collected");
		self.disconnect("body_entered", self, "_on_Area2D_body_entered");
		var _error = anim.connect("animation_finished", self, "_on_anim_animation_finished");

func _on_anim_animation_finished():
	queue_free();
