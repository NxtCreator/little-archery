extends VBoxContainer
@export var upgrade_name: String
@export var upgrade_icon: Texture2D
@export var upgrade_price: int
@export var upgrade_id: String
@export var max_level = 5

func _ready() -> void:
	$Label.text = upgrade_name
	$TextureRect.texture = upgrade_icon
	$PurchaseButton.text = str(upgrade_price)
	$ProgressBar.max_value = max_level
	$ProgressBar.value = GameData.upgrade_levels[upgrade_id]

func _on_purchase_button_pressed() -> void:
	if GameData.upgrade_levels[upgrade_id] >= max_level:
		return
	if GameData.coins < upgrade_price:
		return
	GameData.coins -= upgrade_price
	GameData.upgrade_levels[upgrade_id] += 1
	$ProgressBar.value = GameData.upgrade_levels[upgrade_id]
