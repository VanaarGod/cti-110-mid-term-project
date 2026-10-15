extends Node2D

@export var bullet_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Hello World!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			var bullet = bullet_scene.instantiate()
			add_child(bullet)
			bullet.global_transform = global_transform
			bullet.apply_central_impulse(global_transform.x * 1000.0)
