extends Area2D

@onready var polygon_2d: Polygon2D = $Polygon2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation_degrees = randf_range(0.0, 360.0)
	polygon_2d.color.s = 0.5
	polygon_2d.color.h = randf()

func _on_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		body.queue_free()
		polygon_2d.color = Color.WHITE
		scale  = scale * 1.5
		collision_mask = 0
		audio_stream_player_2d.play()
		await get_tree().create_timer(0.05).timeout
		queue_free()
