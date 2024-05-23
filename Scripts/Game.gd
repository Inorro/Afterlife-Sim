extends Node2D

var paper_stack = []

var paper_scene = preload("res://Scenes/Paper.tscn")
var scene = preload("res://Scenes/Paper.tscn")
@onready var button = $Buttons/Button
@onready var button2 = $Buttons/Button2
@onready var paper1 = $Paper
@onready var paper2 = $Paper2
@onready var paper3 = $Paper3
@onready var paper1l = $Paper/Label
@onready var paper2l = $Paper2/Label
@onready var paper3sprite = $Paper3/Sprite2D
@onready var paper3l = $Paper3/Label
@onready var paper3main = $Paper3/Label2
@onready var paper1main = $Paper/Label2
@onready var paper2main = $Paper2/Label2

# Called when the node enters the scene tree for the first time.
func _ready():
	var file = FileAccess.open("res://Data/localization.json", FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	var file_data = data
	print(file_data)
	
	button.set_text("Accept")
	button2.set_text("Deny")
	paper1l.text = "Sins"
	paper2l.text = "Virtues"
	paper3sprite.texture = load("res://Assets/pixil-frame-0.png")
	paper3l.text= ""
	paper3main.text= ""
	paper3sprite.scale = Vector2(3, 3)
	paper1main.text = "Killed Diana
	Drugs
	Doesnt flush"
	paper2main.text = "Charity"
	
	for i in range(0, 2):
		var paper = paper_scene.instantiate()
		add_paper(paper)	
	

func add_paper(paper):
	paper_stack.append(paper)
	
	var count = 0
	for p in paper_stack:
		p.z_index = count
		count += 1

func push_paper_to_top(paper):
	paper_stack.erase(paper)
	add_paper(paper)
	
func reset():
	await get_tree().create_timer(1.0).timeout
	paper1.show()
	paper2.show()
	paper3.show()
