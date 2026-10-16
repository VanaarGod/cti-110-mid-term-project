extends Node2D

@export var bullet_scene: PackedScene
@onready var polygon_2d: Polygon2D = $Polygon2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Hello World!")
	
var rapid_fire_active: bool = false
var rapid_fire_timer: float = 0.0
var shoot_cooldown: float = 0.0
var shoot_timer: float = 0.0

const NORMAL_SHOOT_DELAY: float = 0.3
const RAPID_SHOOT_DELAY: float = 0.1
const RAPID_FIRE_RATE: float = 0.1
const RAPID_FIRE_DURATION: float = 5.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

	if rapid_fire_active:
		rapid_fire_timer -= delta
		if rapid_fire_timer <= 0.0:
			rapid_fire_active = false
			print("Rapid Fire Ended!")
	if shoot_cooldown > 0.0:
		shoot_cooldown -= delta
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			print("shoot")
			var bullet = bullet_scene.instantiate()
			add_child(bullet)
			bullet.global_transform = global_transform
			bullet.apply_central_impulse(global_transform.x * 1000.0)
			audio_stream_player_2d.play()
			var tween = create_tween()
			tween.tween_property(polygon_2d, "position", Vector2.ZERO, 0.2).from(Vector2(-32.0, 0.0))
			if rapid_fire_active:
				shoot_cooldown = RAPID_SHOOT_DELAY
			else:
				shoot_cooldown = NORMAL_SHOOT_DELAY

func activate_rapid_fire() -> void:
	rapid_fire_active = true
	rapid_fire_timer = RAPID_FIRE_DURATION
	print("Rapid Fire Activated!")
