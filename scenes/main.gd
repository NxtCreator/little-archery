extends Node2D


func _on_timer_timeout() -> void:
	var enemy = preload("res://scenes/enemy.tscn").instantiate()
	add_child(enemy)
	enemy.global_position = Vector2(100, 100)
