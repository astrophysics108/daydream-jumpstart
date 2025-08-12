extends CharacterBody2D

# globals
const SPEED = 800.0
const JUMP_VELOCITY = -600.0
var yummyfoodeaten: int = 5
var hearts_list : Array[TextureRect]

# render the hearts
func _ready() -> void:
	var hearts_parent = $heartscontainer/heartsbox
	for child in hearts_parent.get_children():
		hearts_list.append(child)
	update_hearts()
# take damage from the unknown god
func get_smacked_by_asmoday():
	if yummyfoodeaten > 1:
		yummyfoodeaten -= 1
		update_hearts()
	else:
		get_tree().change_scene_to_file("res://loser.tscn")
		

# update the earts display
func update_hearts():
	for i in range(hearts_list.size()):
		hearts_list[i].visible = i < yummyfoodeaten

func win_the_game():
	get_tree().change_scene_to_file("res://winner.tscn")
		
# jumping etc
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("down") and not is_on_floor():
		velocity.y = -JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
