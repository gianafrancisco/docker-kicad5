# Kicad 5.1.X Inside Docker

This docker file allow to run kicad GUI app, so you can use the latest kicad version on any linux distribution.

## How to build

```bash
docker -t kicad:5.1 --build-arg U_ID=$(id -u) --build-arg G_ID=$(id -g) .
```

## How to run kicad

```bash
docker run --net=host --env="DISPLAY" --volume="/run/user/$(id -u)/gdm/Xauthority:/root/.Xauthority:rw" --volume="$HOME/kicad-workspace:/home/appuser/kicad-workspace" kicad:5.1
```

or use the next command to execute kicad

```bash
docker run --net=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --rm --volume="$HOME/kicad-workspace:/home/appuser/kicad-workspace" kicad:5.1
```

if you are using debian and it shows he net error

```bash
Error: Unable to initialize GTK+, is DISPLAY set properly?
```

Please try to run the command "xhost +" before.
