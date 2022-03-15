extends KinematicBody2D


onready var anim : AnimationPlayer = $AnimationPlayer;
onready var sprite : Sprite = $Sprite;

var speed : int = 125;
var jump_speed : int = -350;
var gravity : int = 1000;

var velocity : Vector2 = Vector2.ZERO;

func _ready() -> void:
	anim.play("idle");
	_change_character("pink man");

func get_input() -> void:
	velocity.x = 0;
	if Input.is_action_pressed("walk_right"):
		velocity.x += speed;
		sprite.flip_h = false;
	elif Input.is_action_pressed("walk_left"):
		velocity.x -= speed;
		sprite.flip_h = true;
	if velocity.y != 0: anim.play("jump")
	elif velocity.x != 0: anim.play("run")
	elif velocity == Vector2(0, 0):
		sprite.hframes = 11;
		anim.play("idle")

func _physics_process(delta) -> void:
	get_input();
	velocity.y += gravity * delta;
	velocity = move_and_slide(velocity, Vector2.UP);
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_speed;

func bounce():
	velocity.y = jump_speed;

func hit():
	pass;

var characters : Array = ["mask dude", "ninja frog", "pink man", "virtual guy"];

func _on_Timer_timeout():
	_change_character(characters[0]);
	characters.shuffle();


func _change_character(character : String) -> void:
	var path : String = "res://assets/main characters/" + character;
	var files = custom.list_files_in_dir(path);
	var anim_name : String;
	var texture : StreamTexture;
	var track_idx : int;
	for file_name in files:
		anim_name = file_name.left(file_name.find_last(" ("))
		if anim.has_animation(anim_name):
			texture = load(path + "/" + file_name);
			track_idx = anim.get_animation(anim_name).find_track("Sprite:texture");
			anim.get_animation(anim_name).track_set_key_value(track_idx, 0, texture);
