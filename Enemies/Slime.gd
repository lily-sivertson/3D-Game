extends CharacterBody3D


const SPEED = 2
#const JUMP_VELOCITY = 4.5

var tween
var health= 30
var player_near=false #if the player is within its circle of sight
var temp=Vector3.ZERO

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(_delta):
	# Add the gravity.
	if player_near==true:
		if $AnimationPlayer2.is_playing():
			var player=get_node_or_null("/root/Game/Player")
			var target=player.global_position
			var point= self.global_position.direction_to(target).normalized()
			'''look_at(target)
			rotation.y=0'''
			
			velocity=point*SPEED
			velocity=Vector3(velocity.x,0,velocity.z)
			temp=global_position+velocity
			'''global_position+=velocity
	
			print(velocity)
			print(global_position)'''
			tween=create_tween()
			tween.tween_property(self,"global_position",temp,1.66)
			#move_and_slide()
			
		
	

func damage(d):
	health-=d
	if health<=0:
		queue_free()
		Global.upd_score(25)
		

	'''# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()'''
	
	
	
	
	
	


func _on_area_3d_body_entered(body):
	if body.name=="Player":
		player_near=true
	


func _on_animation_player_2_animation_finished(anim_name):
	if anim_name=="jump":
		velocity=Vector3.ZERO
		$Timer.start()
		$jump.play()
		



func _on_timer_timeout():
	$AnimationPlayer2.play("jump")


func _on_coll_body_entered(body):
	if body.name=="Player":
		var player=get_node_or_null("/root/Game/Player")
		player.velocity=velocity
		Global.upd_health(10)
		tween=create_tween()
		tween.tween_property(player, "position",player.global_position+(3*velocity),.2)
		
		

