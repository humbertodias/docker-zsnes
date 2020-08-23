# docker-zsnes

Build

```
docker build . -t hldtux/zsnes
```

Run

xhost +


```
docker run -it --rm -u 1000:1000 \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY \
-v /run/dbus:/run/dbus \
-v /dev/shm:/dev/shm \
--device /dev/snd \
--device /dev/dri \
--device /dev/input/js0 \
-e PULSE_SERVER=unix:$XDG_RUNTIME_DIR/pulse/native \
-v $XDG_RUNTIME_DIR/pulse/native:$XDG_RUNTIME_DIR/pulse/native \
--group-add $(getent group audio | cut -d: -f3) \
-v ~/Downloads/roms:/home/docker/snes \
-v ~/.local/share:/.local/share \
hldtux/zsnes
```


Mac OS

XQuartz running

```
docker run -it --rm -u 1000:1000 \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY=docker.for.mac.host.internal:0 \
-v ~/.config/pulse:/run/user/1000/pulse \
-v ~/Downloads/roms:/home/docker \
-v ~/.local/share:/.local/share \
hldtux/zsnes
```