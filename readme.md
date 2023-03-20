# GDScript Runner

Running GDScript ideas in CLI is faster than using [this GDScript playground](https://gd.tumeo.space),
and also the above playground is not using the latest version of Godot.

### Example

```bash
$ ./new -r hello-world
```
This automatically generates and opens the file `hello-world.gd`, whereafter `_init()` has been implemented:
```gdscript
extends Node


func _init() -> void:
    print("hello world")


func _ready() -> void:
    queue_free()


# vim:et:ts=4:sts=4:sw=4
```
Saving and exiting the editor automatically runs the script:
```
> Godot Engine v4.0.stable.mono.official.92bee43ad - https://godotengine.org
>
> hello world
```
You can also manually invoke any script previously created:
```bash
$ ./run.gd hello-world
```
Scripts are saved to a `scripts/` directory.  You should only use the basename of the script, and you
can omit the `.gd` file extension.

### Requirements

- [Godot 4](https://godotengine.org)
- `godot4` executable in `PATH` pointed at the above
