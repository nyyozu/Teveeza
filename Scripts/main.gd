extends Node2D

@onready var camera_1 = $"Splitscreen/GridContainer/SVPC-P1/SVP-P1/CAMP1"
@onready var camera_2 = $"Splitscreen/GridContainer/SVPC-P2/SVP-P2/CAMP2"
@onready var player_1 = $World/P1
@onready var player_2 = $World/P2

func _ready() -> void:
	_setup_shared_world()
	camera_1.make_current()
	camera_2.make_current()

func _process(_delta):
	pass
	
func _setup_shared_world():
	$"Splitscreen/GridContainer/SVPC-P1/SVP-P1".world_2d = get_viewport().world_2d
	$"Splitscreen/GridContainer/SVPC-P2/SVP-P2".world_2d = get_viewport().world_2d
