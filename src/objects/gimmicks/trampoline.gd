extends StaticBody2D

onready var anim : AnimatedSprite = $AnimatedSprite;

func _ready() -> void:
	anim.play("idle");
	custom.connect_signal($JumpBox, "body_entered", self, "_on_body_entered", []);

func _on_body_entered(body) -> void:
	if body.name != "Player": return;
	body.bounce(1.5);
	custom.connect_signal(anim, "animation_finished", self, "_on_animation_finished", []);
	anim.play("jump");

func _on_animation_finished():
	anim.play("idle");
	anim.disconnect("animation_finished", self, "_on_animation_finished");
