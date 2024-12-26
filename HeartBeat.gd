extends TextureRect

@onready var timer := $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	modulate = Color(1., 1., 1., sin(timer.time_left*PI*2))
	pass
