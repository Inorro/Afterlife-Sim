extends Node2D

var paper_stack = []

var paper_scene = preload("res://Scenes/Paper.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var button = $Buttons/Button
	var button2 = $Buttons/Button2
	var paper1 = $Paper/Label
	var paper2 = $Paper2/Label
	var paper1main = $Paper/Label2
	var paper2main = $Paper2/Label2
	button.set_text("Accept")
	button2.set_text("Deny")
	paper1.text = "Sins"
	paper2.text = "Virtues"
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
