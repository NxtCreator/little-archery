extends VBoxContainer
@export var upgrade_name: String
@export var upgrade_icon: Texture2D
@export var upgrade_price: int
@export var upgrade_id: String

func _ready() -> void:
	$Label.text = upgrade_name
	$TextureRect.texture = upgrade_icon
	$PurchaseButton.text = str(upgrade_price)


func _on_purchase_button_pressed() -> void:
	if GameData.coins < upgrade_price:
		return
	GameData.coins -= upgrade_price
	GameData.upgrade_levels[upgrade_id] += 1
	print("Upgrade Level", GameData.upgrade_levels[upgrade_id])
