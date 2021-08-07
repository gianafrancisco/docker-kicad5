# Kicad 5.1.X Inside Docker

This docker file allow to run kicad GUI app, so you can use the latest kicad version on any linux distribution.

## How to build

```bash
docker build -t kicad:5.1 --build-arg U_ID=$(id -u) --build-arg G_ID=$(id -g) --build-arg USERNAME=$USER .
```

## How to run kicad

```bash
docker run --net=host --env="DISPLAY" \
--rm \
--name kicad5 \
--volume="/run/user/$(id -u)/gdm/Xauthority:/root/.Xauthority:rw" \
--volume="$HOME/kicad-workspace:/home/$USER/kicad-workspace" \
--volume="$HOME/kicad-workspace/kicad-libs/:/usr/share/kicad" \
kicad:5.1
```

or use the next command to execute kicad

```bash
docker run --net=host -e DISPLAY=$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix \
--rm \
--name kicad5 \
--volume="$HOME/kicad-workspace:/home/$USER/kicad-workspace" \
--volume="$HOME/kicad-workspace/kicad-libs/:/usr/share/kicad" \
kicad:5.1
```

## Install extra packages

```bash
docker exec -u root kicad5 apt install -y kicad-libraries kicad-symbols kicad-templates kicad-packages3d kicad-footprints
```

if you are using debian and it shows he net error

```bash
Error: Unable to initialize GTK+, is DISPLAY set properly?
```

Please try to run the command "xhost +" before.
