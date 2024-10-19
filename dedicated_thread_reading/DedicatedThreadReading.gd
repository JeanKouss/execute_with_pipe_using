extends Control

var prime_program_path = "count.py"
var process_io : FileAccess
var prime_process = null
var thread
var read_next_line : bool = false

func _ready():
	prime_process = OS.execute_with_pipe("python3", [prime_program_path])
	process_io = prime_process['stdio']
	thread = Thread.new()
	thread.start(read_process_output)

func _input(event: InputEvent) -> void:
	if event.is_action_released("ui_accept") :
		read_next_line = true
	if event.is_action_released("ui_right") :
		process_io.store_line('s')

func read_process_output() :
	while process_io.is_open() and process_io.get_error() == OK :
		if read_next_line : 
			print(process_io.get_line())
			read_next_line = false