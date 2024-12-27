extends Control

var process_io : FileAccess
var process = null

func _ready():
	process = OS.execute_with_pipe("cmd.exe", ['/c', 'ping 8.8.8.8 -t'])
	process_io = process['stdio']


func _process(_delta: float) -> void:
	if process_io.is_open() and process_io.get_error() == OK :
		print(process_io.get_line())
