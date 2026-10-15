extends Node2D

@export var enemy_scene: PackedScene

func on_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
