extends CharacterBody3D

@export var speed := 5.0
@export var camera_sensitivity := 0.2
var camera_mode := 0 # 0 = top-down, 1 = third-person

func _ready():
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
    if Input.is_action_just_pressed("ui_accept"):
        camera_mode = 1 - camera_mode
        var cam = $Camera3D
        cam.transform.origin = camera_mode == 0 ? Vector3(0, 15, 0) : Vector3(0, 3, -5)
        cam.look_at(Vector3.ZERO)

func _physics_process(delta):
    var input_dir = Vector2(
        Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
        Input.get_action_strength("move_back") - Input.get_action_strength("move_forward")
    )
    var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
    velocity.x = direction.x * speed
    velocity.z = direction.z * speed
    move_and_slide()
