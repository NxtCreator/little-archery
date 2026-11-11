extends CharacterBody2D
@export var speed = 200
@export var health = 3

func take_damage(amount: int) -> void:
	var parent = get_parent()
	var coin_pos = global_position

	health -= amount
	if health <= 0:
		var coin = preload("res://scenes/coin.tscn").instantiate()
		queue_free()
		parent.add_child.call_deferred(coin)
		coin.set_deferred("global_position", coin_pos)

func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	var player = get_tree().get_first_node_in_group("player")
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
