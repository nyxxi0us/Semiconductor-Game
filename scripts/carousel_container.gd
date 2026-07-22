@tool
class_name CarouselContainer
extends Node2D

@export var spacing: float = 20.0

@export var wraparound_enabled: bool = false
@export var wraparound_radius: float = 300.0
@export var wraparound_height: float = 50.0

@export_range(0.0, 1.0) var opacity_strength: float = 0.35
@export_range(0.0, 1.0) var scale_strength: float = 0.25
@export_range(0.01, 0.99, 0.01) var scale_min: float = 0.1

@export var smoothing_speed: float = 6.5
@export var selected_index: int = 0
@export var follow_button_focus: bool = false

@export var position_offset_node: Control = null

func _process(delta: float) -> void:
	if !position_offset_node or position_offset_node.get_child_count()
