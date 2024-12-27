extends Control

var process_io : FileAccess
var process = null
var thread

func _ready():
	process = OS.execute_with_pipe("cmd.exe", ['/c', 'ping 8.8.8.8 -t'])
	process_io = process['stdio']
	thread = Thread.new()
	thread.start(read_process_output)

func read_process_output() :
	while process_io.is_open() and process_io.get_error() == OK :
		print(process_io.get_line())