extends Control

var prime_process = null
var prime_program_path = "prime.py"

func _process(_delta: float) -> void:
	print_process_output(prime_process)
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_released("ui_accept") :
		prime_process = OS.execute_with_pipe("python3", [prime_program_path])

func print_process_output(process) :
	if not process :
		return
	var process_io = process['stdio']
	if process_io.is_open() and process_io.get_error() == OK :
		print(process_io.get_line())