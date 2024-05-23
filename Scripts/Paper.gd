extends CharacterBody2D

var draggingDistance
var dir
var dragging
var newPosition = Vector2()
@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D
var mouse_in = false
var chosen_paper = false

func _on_ready(): 
	var size = sprite_2d.texture.get_size()
	collision_shape_2d.shape.extents = size

func _input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			if chosen_paper and event.is_pressed() && mouse_in:
				draggingDistance = position.distance_to(get_viewport().get_mouse_position())
				dir = (get_viewport().get_mouse_position() - position).normalized()
				dragging = true
				newPosition = get_viewport().get_mouse_position() - draggingDistance * dir
			else:
				dragging = false
				chosen_paper = false
		else:
			if chosen_paper and event.is_pressed() && mouse_in:
				sprite_2d.scale = Vector2(2,2)
				get_node("Label").set("theme_override_font_sizes/font_size", 50)
				get_node("Label2").set("theme_override_font_sizes/font_size", 40)
			elif mouse_in and chosen_paper:
				sprite_2d.scale = Vector2(1,1)
				get_node("Label").set("theme_override_font_sizes/font_size", 25)
				get_node("Label2").set("theme_override_font_sizes/font_size", 20)
			
	elif event is InputEventMouseMotion:
		if dragging:
			newPosition = get_viewport().get_mouse_position() - draggingDistance * dir

func _physics_process(_delta):
	if dragging:
		set_velocity((newPosition - position) * Vector2(30, 30))
		move_and_slide()


func chosen():
	chosen_paper = true
	
func mouse_entered():
	mouse_in = true

func mouse_exited():
	mouse_in = false
