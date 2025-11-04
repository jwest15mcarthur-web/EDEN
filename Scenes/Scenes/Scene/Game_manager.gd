extends Node3D

func _ready():
    print("Dark Fantasy MORPG - Prototype Loaded")
    var player = load("res://scenes/player.tscn").instantiate()
    add_child(player)
