## Kicad 5.0.0 Inside Docker

This docker file allow to run kicad GUI app, so you can use the latest kicad version on any linux distribution.

## How to build

docker -t kicad5 .

## How to run kicad

docker run --net=host --env="DISPLAY" --volume="/run/user/$(id -u)/gdm/Xauthority:/root/.Xauthority:rw" --volume="/kicad-workspace:/opt/kicad-workspace" kicad5


