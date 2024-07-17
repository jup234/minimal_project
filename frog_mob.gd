class_name enemy
extends CharacterBody2D

@export var speed = 50
@export var acceleration = 50


@onready var animation = get_node("AnimatedSprite2D")
@onready var player = get_node("../../Player/Player")


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var chase = false

func _on_ready():
	animation.play("Idle")
	add_to_group("enemy")

func _on_playerdetection_body_entered(body):
	if body.is_in_group("Player_body"):
		chase = true

func _on_playerdetection_body_exited(body):
	if body.is_in_group("Player_body"):
		chase = false

#gravity
#Define variable direction and set velocity (speed) then check if node IS NOT death then play animation jump
#then check for direction value if value is less than zero turn left and if greater than zero turn right
func _physics_process(delta):
	velocity.y += gravity * delta
	move_and_slide()
	if chase == true:
		var direction = (player.position - self.global_position).normalized()
		velocity.x = direction.x * speed
		if get_node("AnimatedSprite2D").animation != "Death":
			get_node("AnimatedSprite2D").play("Jump")
		if direction.x < 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
	elif get_node("AnimatedSprite2D").animation != "Death":
		animation.play("Idle")
		velocity.x = 0
	if (Game.playerHP <= 0):
		chase = false


func _on_player_collision_body_entered(body):
	if body.is_in_group("Player_body"):
		Game.playerHP -= 3
