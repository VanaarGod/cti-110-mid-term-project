extends Node2D

@export var enemy_scene: PackedScene
@export var power_up_scene: PackedScene

var power_up_timer: float = 0.0
const POWER_UP_SPAWN_DELAY: float = 10.0

func _on_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
	enemy.global_position.x = randf_range(-500, 500)
	enemy.global_position.y = randf_range(-300, 300)

func _process(delta: float) -> void:
	power_up_timer += delta

	if power_up_timer >= POWER_UP_SPAWN_DELAY:
		power_up_timer = 0.0
		spawn_power_up()


func spawn_power_up() -> void:
	var power_up = power_up_scene.instantiate()

	var screen_size = get_viewport_rect().size

	power_up.position = Vector2(
		randf_range(50.0, screen_size.x - 50.0),
		randf_range(50.0, screen_size.y - 50.0)
	)

	add_child(power_up)
