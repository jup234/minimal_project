extends Area2D

#@onready var anim = get_node("Cherry_animation")


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Cherry_pickup_animation").play("Cherry")











# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		pass
