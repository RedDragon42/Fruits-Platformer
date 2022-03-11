extends KinematicBody2D


onready var animation : AnimationPlayer = $AnimationPlayer;
onready var sprite : Sprite = $Sprite;

export (int) var speed = 125;
export (int) var jump_speed = -350;
export (int) var gravity = 1000;

var velocity = Vector2.ZERO;

func _ready():
	animation.play("idle");

func get_input():
	velocity.x = 0;
	if Input.is_action_pressed("walk_right"):
		velocity.x += speed;
		sprite.flip_h = false;
	elif Input.is_action_pressed("walk_left"):
		velocity.x -= speed;
		sprite.flip_h = true;
	if velocity.y != 0: animation.play("jump")
	elif velocity.x != 0: animation.play("walk")
	elif velocity == Vector2(0, 0):
		pass
#		animation.play("idle")

func _physics_process(delta):
	get_input();
	velocity.y += gravity * delta;
	velocity = move_and_slide(velocity, Vector2.UP);
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_speed;
	elif velocity == Vector2(0, 0):
		sprite.hframes = 11;
		animation.play("idle")
