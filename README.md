# docker-zsnes

## Build

```
docker build . -t hldtux/zsnes
```

Run

```
xhost +
```

## Linux

```
docker run -d -it --rm \
--cap-add=SYS_PTRACE \
-u 1000:1000 \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY \
-v /run/dbus:/run/dbus \
-v /dev/shm:/dev/shm \
--device /dev/snd \
--device /dev/dri \
--device /dev/input/js0 \
-e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
-v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
-v ~/Downloads/roms:/home/docker/snes \
-v ~/.local/share:/home/docker/.local/share \
-v ~/.zsnes/:/home/docker/.zsnes \
hldtux/zsnes
```


## Mac OS

[XQuartz](https://www.xquartz.org/) running

```
docker run -d -it --rm -u 1000:1000 \
--cap-add=SYS_PTRACE \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY=docker.for.mac.host.internal:0 \
-v ~/.config/pulse:/run/user/1000/pulse \
-v ~/Downloads/roms:/home/docker \
-v ~/.local/share:/.local/share \
hldtux/zsnes
```

## Windows

[Xming](https://sourceforge.net/projects/xming/) running


```
docker run -it --rm --cap-add=SYS_PTRACE -u 1000:1000 -e DISPLAY=192.168.1.6:0.0 --privileged -v C:\Users\hdias\Downloads\roms:home/docker hldtux/zsnes
```

## Test

Attaching to zsnes process

```
docker exec --privileged -ti `docker ps --filter "ancestor=hldtux/zsnes" -q` sudo memdig --attach zsnes
```

Change
```
push $ADDRESS
set $RANGE
q
```

* Super Mario World [USA]

    | Variable    | Address    | Range  |
    | ------------|:----------:| ------ | 
    | MOEDAS      | 0x569f543f | 0-99   |
    | YOSHICOINS  | 0x569f5aa2 | 0-4    |
    | STATUSMARIO | 0x569f4699 | 0-3    |



# Ref

* [Memdig](https://github.com/skeeto/memdig)
* [Zsnes](https://www.zsnes.com)