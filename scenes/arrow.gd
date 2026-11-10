extends Area2D
@export var speed = 600
var direction = Vector2.RIGHT


func _physics_process(delta: float) -> void:
	position += direction * speed * delta
