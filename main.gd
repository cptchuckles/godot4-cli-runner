extends SceneTree


func _initialize() -> void:
    var args = OS.get_cmdline_args()
    if args.size() != 3:
        return die("Usage: %s <script>" % args[1])

    var script_path = "res://scripts/%s" % args[2]
    if not script_path.ends_with(".gd"):
        script_path += ".gd"

    if not FileAccess.file_exists(script_path):
        return die("File %s does not exist" % script_path)

    var script = load(script_path)
    if not script is GDScript:
        return die("File %s is not GDScript" % script_path)

    var run = script.new()
    if not is_instance_valid(run):
        return die("Could not instantiate script %s" % script_path)

    if not run is Node:
        return die("Script %s does not extend Node" % script_path)

    root.add_child(run)
    run.tree_exited.connect(quit)


func die(msg: String) -> void:
    printerr(msg)
    quit(1)


# vim:et:ts=4:sts=4:sw=4
