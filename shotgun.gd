extends RigidBody2D

@onready var trail_pivot: Node2D = $TrailPivot

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	trail_pivot.scale.x += delta * 4


func _on_timer_timeout() -> void:
	queue_free()
