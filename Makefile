build:
	docker build . -t hldtux/zsnes
	
run:
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

run-mac:
	docker run -d -it --rm -u 1000:1000 \
	--cap-add=SYS_PTRACE \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=docker.for.mac.host.internal:0 \
	-v ~/.config/pulse:/run/user/1000/pulse \
	-v ~/Downloads/roms:/home/docker \
	-v ~/.local/share:/.local/share \
	hldtux/zsnes
