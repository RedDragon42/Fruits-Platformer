extends KinematicBody2D

onready var anim : AnimatedSprite = $AnimatedSprite;

var velocity : Vector2 = Vector2.ZERO;
var dir : int = 1;
var speed : int = 50;

func _ready() -> void:
	anim.play("idle-move");
	custom.connect_signal($HurtBox, "body_entered", self, "_on_hurtbox_body_entered", []);
	custom.connect_signal($HitBox, "body_entered", self, "_on_hitbox_body_entered", []);

func _physics_process(_delta) -> void:
	velocity.x = dir * speed;
	velocity = move_and_slide(velocity, Vector2.UP);
	if is_on_wall(): dir *= -1;
	anim.flip_h = false if dir == -1 else true;

func _on_hurtbox_body_entered(body) -> void:
	if body.name != "Player": return;
	body.bounce(0.8);
	_death();

func _on_hitbox_body_entered(body) -> void:
	if body.name != "Player": return;
	body.hit();

func _death() -> void:
	set_physics_process(false);
	$CollisionShape2D.call_deferred("set", "disabled", true);
	$HurtBox/CollisionShape2D.call_deferred("set", "disabled", true);
	$HitBox/CollisionShape2D.call_deferred("set", "disabled", true);
	anim.play("hit");
	yield(anim, "animation_finished");
	scale = Vector2(0.5, 0.5);
	anim.play("desappearing");
	yield(anim, "animation_finished");
	queue_free();
