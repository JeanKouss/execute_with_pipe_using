extends Node2D

var cmd_proces
var path := "python3"
var stdio : FileAccess
var thread : Thread

var started := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# cmd_proces = OS.execute_with_pipe(path, ["E:\\projects\\articles_projects\\execute_with_pipe_using\\prime.py"])
	cmd_proces = OS.execute_with_pipe(path, ["only_print.py"])
	stdio = cmd_proces['stdio']
	thread = Thread.new()
	thread.start(_thread_func)
	pass

# func _process(_delta: float) -> void:
# 	if not started :
# 		return
# 	print('----')
# 	if stdio.is_open() and stdio.get_error()==OK:
# 		print(stdio.get_line())


func _thread_func():
	while stdio.is_open() and stdio.get_error()==OK:
		got_it.call_deferred(stdio.get_line())
	prints("all done", stdio.is_open(), stdio.get_error())

func got_it(l) :
	print('gotten', l)

func _input(event: InputEvent) -> void:
	if event.is_action_released("ui_accept") :
		# stdio.store_line('input')
		started = true