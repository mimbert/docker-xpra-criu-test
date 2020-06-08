FROM debian:buster
ENV DEBIAN_FRONTEND=noninteractive
ENV APT="apt-get -q -y"
RUN ${APT} update && ${APT} dist-upgrade
RUN ${APT} install xpra xvfb procps x11-apps
RUN ${APT} clean && rm -rf /var/lib/apt/lists
RUN mkdir -p /run/user/0/
CMD xpra --speaker=no --dbus-launch=no --dbus-control=no --notifications=no --mdns=no --webcam=no --html=off --daemon=no start --bind-tcp=0.0.0.0:16661 --env=GDK_DPI_SCALE=1 --exit-with-children --start-child="xcalc"
