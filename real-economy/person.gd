extends CharacterBody3D
var speed = 2
var target : Vector3 
var localMesh
var employment = employmentType.new()
func _ready() -> void:
	target=self.global_position
func _process(delta: float) -> void:
	if !is_inside_tree():
		return
	if 1== 1:
		target = self.global_position
		velocity = global_position.direction_to(target) * speed
		move_and_slide()
		return
	velocity = global_position.direction_to(target) * speed
	move_and_slide()
