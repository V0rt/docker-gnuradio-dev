docker run \
	--net=host\
	--env="DISPLAY"\
	--name="gr38"\
	--volume="$HOME/.Xauthority:/root/.Xauthority:rw"\
	--privileged\
	--device /dev/snd\
	--group-add=audio\
	-v persistent-gr38:/home/user/persistent\
	-v /dev/bus/usb:/dev/bus/usb\
	-v "$HOME/git":/home/user/git\
	-it\
	gr38:latest bash


#--group-add=audio -it ubuntu:gnuradio-releases-3.7 bash