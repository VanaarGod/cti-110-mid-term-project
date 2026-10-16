extends Area2D

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	if area.name == "PowerUpDetector":
		var player = area.get_parent()
		player.activate_rapid_fire()
		print("Rapid Fire collected!")
		queue_free()
