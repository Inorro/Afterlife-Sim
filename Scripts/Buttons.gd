extends Node

var button_functions : Dictionary
@onready var button1 = $Button
@onready var button2 = $Button2
@onready var label = $"../Label"

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
	label.text = "{Name} accepted into heaven"
	
func deny():
	label.visible = true
	label.text = "{Name} sent to hell"
