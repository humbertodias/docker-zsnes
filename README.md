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
make run-linux
```


## Mac OS

[XQuartz](https://www.xquartz.org/) running

```
make run-mac
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