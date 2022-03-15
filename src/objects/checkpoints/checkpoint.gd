extends Area2D

onready var anim : AnimatedSprite = $AnimatedSprite;

func _ready():
	self.connect("body_entered", self, "_on_body_entered");
	anim.play("no_flag");

func _on_body_entered(body):
	if body.name != "Player": return;
	self.disconnect("body_entered", self, "_on_body_entered");
	anim.play("flag_out");
	anim.connect("animation_finished", self, "_on_animation_finished");
	$Particles2D.emitting = true;

func _on_animation_finished():
	anim.disconnect("animation_finished", self, "_on_animation_finished");
	anim.play("idle_flag");

