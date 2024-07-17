extends Node2D

@onready var anim = get_node("ParallaxBackgroundBG/ParallaxLayer3/AnimatedSprite2D")


# loads the game and resets it. U.savegame and U.loadgame saves the game in it's starting form and loads it
# Remove Utils.savegame if you wanna continue from where you left off
func _ready():
	anim.play("Eagle")
	Utils.SaveGame()
	Utils.LoadGame()
	
	
	
func _on_quit_pressed():
	get_tree().quit()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
	Game.playerHP = 100
	Game.Gold = 0
	Game.Cherry = 0

