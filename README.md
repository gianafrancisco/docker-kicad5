## Kicad 5.1.5 Inside Docker

This docker file allow to run kicad GUI app, so you can use the latest kicad version on any linux distribution.

## How to build

```
docker -t kicad5 .
```

## How to run kicad

```
docker run --net=host --env="DISPLAY" --volume="/run/user/$(id -u)/gdm/Xauthority:/root/.Xauthority:rw" --volume="/kicad-workspace:/opt/kicad-workspace" kicad5
```
or use the next command to execute kicad
```
docker run --net=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --rm --volume="/kicad-workspace:/opt/kicad-workspace" kicad:5.1.5
```

if you are using debina and it shows he net error

```
Error: Unable to initialize GTK+, is DISPLAY set properly?
```
Please try to run the command "xhost +" before.

