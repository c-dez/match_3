class_name ButtonClass
extends Button

# para centrar pivote sprite lleva position de 64, 64
@onready var sprite: Sprite2D = get_node("Sprite2D")
var grow_scale:= Vector2(1.2,1.2)

func _ready() -> void:
	var minimum_size := Vector2(128,128)
	custom_minimum_size = minimum_size
	sprite.visible = false


func _on_mouse_entered() -> void:
	sprite.scale = grow_scale
	sprite.visible = true

	pass # Replace with function body.


func _on_mouse_exited() -> void:
	sprite.scale = Vector2(1.0,1.0)
	sprite.visible = false

	pass # Replace with function body.
