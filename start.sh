docker run \
	--net=host\
	--env="DISPLAY"\
	--name="grt"\
	--volume="$HOME/.Xauthority:/root/.Xauthority:rw"\
	--privileged\
	--device /dev/snd\
	--group-add=audio\
	-v "/media/user/Files 2T/REC":/home/user/REC\
	-v /dev/bus/usb:/dev/bus/usb\
	-v "$HOME/git":/home/user/git\
	-v /opt/gr/usr:/usr\
	-it\
	--entrypoint gnuradio-companion\
	gr37:latest



# #--group-add=audio -it ubuntu:gnuradio-releases-3.7 bash


# docker run \
# 	--rm\
# 	--net=bridge\
# 	--env="DISPLAY"\
# 	--name="gr37"\
# 	--hostname="gr37"\
# 	--privileged\
# 	--device /dev/snd\
# 	--group-add=audio\
# 	-v /dev/bus/usb:/dev/bus/usb\
# 	-v "$HOME/.Xauthority":/root/.Xauthority:rw\
# 	-v "$HOME/git":/home/user/git\
# 	-v /opt/gr/bin:/usr/bin\
# 	-p 2022:22\
# 	-t\
# 	gr37:latest bash


# #--group-add=audio -it ubuntu:gnuradio-releases-3.7 bash --detach\ 	--restart=always\
