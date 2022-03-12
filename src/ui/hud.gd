extends CanvasLayer

onready var fruit_counter0 : Sprite = $Sprite;
onready var fruit_counter1 : Sprite = $Sprite2;

var fruits : int = 8;

func _ready():
		fruit_counter0.frame = 30 + fruits % 10;
		fruit_counter1.frame = 30 + fruits / 10;


func add_fruit():
	fruits += 1;
	if fruits < 10:
		fruit_counter0.frame += 1;
	else:
		fruit_counter0.frame = 30 + fruits % 10;
		fruit_counter1.frame = 30 + fruits / 10;
