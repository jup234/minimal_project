class_name damageable
extends Node
#frog death and damage script

@export var health : int = 20
@onready var label = $"../Label"

func hit(damage : int):
	health -= damage
	if health <= 0:
		get_parent().chase = false
		get_parent().velocity.x = 0
		Game.Gold += 5
		Utils.SaveGame()
		get_node("../AnimatedSprite2D").play("Death")
		await get_node("../AnimatedSprite2D").animation_finished
		get_parent().queue_free()

func _physics_process(_delta):
	label.text = str(health)




