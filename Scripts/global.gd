extends Node

var file = FileAccess.open("res://Data/localization.json", FileAccess.READ)
var data = JSON.parse_string(file.get_as_text())
var file_data = data
var NPCdata1 = file_data["Sheet1"]
@onready var paper1 = get_tree().root.get_node("Game/Paper")
@onready var paper2 = get_tree().root.get_node("Game/Paper2")
@onready var paper3 = get_tree().root.get_node("Game/Paper3")
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
