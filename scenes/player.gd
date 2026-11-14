extends CharacterBody2D
@export var speed = 300
@export var attack_range = 400
@export var lives = 1
@export var close_range = 200
var direction = Vector2.ZERO

func count_coins():
	GameData.coins += 1

func get_nearest_enemy(max_distance):
	var nearest = null
	var nearest_distance = max_distance
	for enemy in get_tree().get_nodes_in_group("enemy"):
		var d = global_position.distance_to(enemy.global_position)
		if d < nearest_distance:
			nearest_distance = d
			nearest = enemy
	return nearest
		
func face(dir: Vector2) -> void:
	$Sprite2D.rotation = dir.angle() - PI / 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lives += GameData.upgrade_levels["health"]
	speed += 30 * GameData.upgrade_levels["speed"]
	$Timer.wait_time = max(0.15, 0.5 - 0.05 * GameData.upgrade_levels["reload"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	direction = Input.get_vector( "move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()
	
	var close_enemy = get_nearest_enemy(close_range)
	if close_enemy != null:
		face(close_enemy.global_position - global_position)
	elif direction != Vector2.ZERO:
		face(direction)
	else :
		var target = get_nearest_enemy(attack_range)
		if target != null:
			face(target.global_position - global_position)
	var margin = Vector2(50, 50)
	global_position = global_position.clamp(margin, get_viewport_rect().size - margin)
	
	


func _on_timer_timeout() -> void:
	if direction != Vector2.ZERO:
		return
	var parent = get_parent()
	var closest_enemy = get_nearest_enemy(attack_range)
	if closest_enemy == null:
		return
	var arrow = preload("res://scenes/arrow.tscn").instantiate()
	arrow.direction = global_position.direction_to(closest_enemy.global_position)
	arrow.damage = 1 + GameData.upgrade_levels["damage"]
	parent.add_child(arrow)
	arrow.global_position = global_position


func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		lives -= 1
		body.queue_free()
		
		if lives <= 0:
			get_tree().change_scene_to_file.call_deferred("res://scenes/shop.tscn")
			
