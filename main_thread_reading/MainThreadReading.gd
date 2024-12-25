extends Control

var prime_program_path = "count.py"
var process_io : FileAccess
var prime_process = null
var read_next_line : bool = false

func _ready():
	prime_process = OS.execute_with_pipe("python3", [prime_program_path])
	process_io = prime_process['stdio']
	pass

func _process(_delta: float) -> void:
	if read_next_line :
		print(process_io.get_line())
		read_next_line = false

func _input(event: InputEvent) -> void:
	if event.is_action_released("ui_accept") :
		if process_io.is_open() and process_io.get_error() == OK :
			read_next_line = true
			
			