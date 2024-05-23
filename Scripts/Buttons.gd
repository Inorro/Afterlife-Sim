extends Node

var button_functions : Dictionary
@onready var game = get_parent()
@onready var button1 = $Button
@onready var button2 = $Button2
@onready var label = $"../Label"
@onready var paper = $"../Paper"
@onready var paper_2 = $"../Paper2"
@onready var paper_3 = $"../Paper3"


func _ready():

	button_functions = {button1 : "accept",
						button2 : "deny"}
										
	for button in button_functions.keys():
		button.pressed.connect(some_button_pressed.bind(button))

func some_button_pressed(button):
	var function_to_call = button_functions.get(button)
	if function_to_call:
		call(function_to_call)
		
func accept():
	label.visible = true
	label.text = str(Global.NPCdata1[0]["NPC Name"]) + " was accepted into heaven"
	await get_tree().create_timer(1.0).timeout
	paper.hide()
	paper_2.hide()
	paper_3.hide()
	label.hide()
	game.reset()
	
	
func deny():
	label.visible = true
	label.text = str(Global.NPCdata1[0]["NPC Name"]) + " was sent to hell"
	await get_tree().create_timer(1.0).timeout
	paper.hide()
	paper_2.hide()
	paper_3.hide()
	label.hide()
	game.reset()
