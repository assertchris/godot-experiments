extends Path2D
class_name ConnectedPath2D

@export var connected_paths : Array[NodePath] = []

@onready var _label := %Label as Label

func _ready() -> void:
	_label.text = str(get_instance_id())
	_label.position = curve.get_baked_points()[0]
