extends Area2D

onready var anim : AnimatedSprite = $AnimatedSprite;
onready var timer : Timer = $Timer;

var state : String;

func _ready() -> void:
	state = "spike_in";
	anim.play("idle_spike_in");
	timer.start();
	custom.connect_signal(timer, "timeout", self, "_change_state", []);
	custom.connect_signal(self, "body_entered", self, "_on_body_entered", []);

func _change_state() -> void:
	state = "spike_in" if state == "spike_out" else "spike_out";
	anim.play("trans_" + state);
	yield(anim, "animation_finished");
	anim.play("idle_" + state);
	timer.start()

func _on_body_entered(body) -> void:
	if body.name != "Player": return;
	if state == "spike_in":
		body.bounce(0.8); _death();
	else: body.hit();
		
func _death():
	timer.stop();
	$CollisionShape2D.call_deferred("set", "disabled", true);
	anim.play("hit");
	yield(anim, "animation_finished");
	scale = Vector2(0.5, 0.5);
	anim.play("desappearing");
	yield(anim, "animation_finished");
	queue_free();
