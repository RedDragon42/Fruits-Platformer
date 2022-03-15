extends Node

func connect_signal(_source : Object, _signal : String, _targ : Object, _callback : String, _args : Array) -> void:
	if not _source.connect(_signal, _targ, _callback, _args) == OK:
		print("WARNING : %s signal from %s NOT connected to %s" % [_signal, _source.name, _targ.name]);

func list_files_in_dir(path) -> Array:
	var files = [];
	var dir = Directory.new();
	
	dir.open(path);
	dir.list_dir_begin()
	
	var file = dir.get_next()
	
	while file != "":
		if not file.begins_with(".") && not file.ends_with(".import"):
			files.append(file);
		file = dir.get_next();
	dir.list_dir_end();
	
	return files;
