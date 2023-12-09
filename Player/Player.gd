extends CharacterBody3D


var Bullet= load("res://Player/Bullet.tscn")
const Balloon = preload("res://Dialogue/balloon.tscn")
var played=false
var interactable=false

var Weapons
const SPEED = 4.5
const JUMP_VELOCITY = 3
const MOUSE_SENSITIVITY = 0.001
const MOUSE_RANGE = 1.5
var turning=.005
var words= ""
var bod=""

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _unhandled_input(event):
	if event.is_action_pressed("dialogue") and interactable==true:
		var balloon = Balloon.instantiate()
		get_tree().current_scene.add_child(balloon)
		balloon.start(load(words), "main")
		interactable=false
	elif event is InputEventMouseMotion:
	
		# up-down motion, applied to the $Pivot
		$Pivot.rotate_x(-event.relative.y * MOUSE_SENSITIVITY)
		# make sure we can't look inside ourselves :)
		$Pivot.rotation.x = clamp($Pivot.rotation.x, -MOUSE_RANGE, MOUSE_RANGE)
		# left-right motion, applied to the Player
		rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
	
	'''if event.is_action_pressed("shoot"):
		Weapons= get_node_or_null("/root/Game/Weapons")
		if Weapons!=null:
			
			if $Pivot/gun/path.is_colliding():
				var bullet= Bullet.instantiate()
				bullet.global_position= $Pivot/gun/aim.global_position
				var target= $Pivot/gun/path.get_collision_point()
				#var point= bullet.global_position.direction_to(target).normalized()
				bullet.set_direction(bullet.global_position).direction_to(target).normalized()#
				Weapons.add_child(bullet)
			else:
				print("it is not colliding")
			var target =event.position 
			var direct_to_m= bullet.global_position.direction_to(target).normalized()
			bullet.set_direction(direct_to_m)'''

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_pressed("left-turn"):
		rotate_y(5*turning)
	if Input.is_action_pressed("right-turn"):
		rotate_y(-5*turning)

		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()


func _on_area_3d_body_entered(body):
	if body.get_parent().name=="NPCs":
		interactable=true
		words= "res://Dialogue/"+body.name+".dialogue"
		Global.update_bod(body)
		print("yes")
		


func _on_area_3d_body_exited(body):
	if body.get_parent().name=="NPCs":
		interactable=false
		print("no")
		
		
		
	
