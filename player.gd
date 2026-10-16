extends Node2D

@export var bullet_scene: PackedScene
@export var shotgun_scene: PackedScene
@onready var polygon_2d: Polygon2D = $Polygon2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Hello World!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				print("shoot")
				var bullet = bullet_scene.instantiate()
				add_child(bullet)
				bullet.global_transform = global_transform
				bullet.apply_central_impulse(global_transform.x * 1000.0)
				audio_stream_player_2d.play()
				var tween = create_tween()
				tween.tween_property(polygon_2d, "position", Vector2.ZERO, 0.2).from(Vector2(-32.0, 0.0))
			
func _secondary_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
				var shotgun = shotgun_scene.instantiate()
				add_child(shotgun)
				shotgun.global_transform = global_transform
				shotgun.apply_central_impulse(global_transform.x * 1000.0)
				audio_stream_player_2d.play()
				var tween = create_tween()
				tween.tween_property(polygon_2d, "position", Vector2.ZERO, 0.2).from(Vector2(-32.0, 0.0))
