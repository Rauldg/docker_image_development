ARG BASE_IMAGE_NAME

FROM ${BASE_IMAGE_NAME}

# To avoid some errors when fetching apt-get updates. # See: https://stackoverflow.com/a/35976127 
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    bash-completion

RUN apt-get update && apt-get install -y \
    autoconf \ 
    automake \ 
    avahi-daemon \ 
    build-essential \ 
    castxml \ 
    ccache \ 
    cmake \ 
    curl \ 
    cython3 \ 
    freeglut3-dev \ 
    git \
    graphviz \ 
    graphviz-dev \ 
    icecc \ 
    libatlas-base-dev \ 
    libavahi-client-dev \ 
    libavahi-client3 \ 
    libavahi-core-dev \ 
    libboost-python-dev \ 
    libeigen3-dev \ 
    libgdal-dev \ 
    libgfortran4 \ 
    libglew-dev \ 
    libgoogle-glog-dev \ 
    libjsoncpp-dev \ 
    libmono-system-core4.0-cil \ 
    libmono-system-numerics4.0-cil \ 
    libomniorb4-dev \ 
    libopenscenegraph-dev \ 
    libpoco-dev \ 
    libproj-dev \ 
    libqt4-dev \ 
    libqt4-opengl-dev \ 
    libsigc++-2.0-0v5 \ 
    libsigc++-2.0-dev \ 
    libsuitesparse-dev \ 
    libtinyxml-dev \ 
    libusb-1.0-0-dev \ 
    libxaw7-dev \ 
    libxml-xpath-perl \ 
    libxml2-dev \ 
    mono-runtime \ 
    omniidl \ 
    omniorb-nameserver \ 
    pkg-config \ 
    python3 \ 
    python3-dev \ 
    python3-jinja2 \ 
    python3-memory-profiler \ 
    python3-msgpack \ 
    python3-nose \ 
    python3-numpy \ 
    python3-pandas \ 
    python3-pexpect \ 
    python3-pip \ 
    python3-pydot \ 
    python3-pyqt4 \ 
    python3-pyqt4.qtopengl \ 
    python3-yaml \ 
    qt4-qmake \ 
    rake \ 
    xorg-dev

# add workspace init to container initialization
ADD setup_workspace.bash /opt/setup_workspace.bash
RUN chmod 755 /opt/setup_workspace.bash
ADD config_seed.yml /opt/config_seed.yml

# opt/init_workspace.sh is run once via dockercommands.sh by calling check_init_workspace.sh
RUN echo "echo" >> /opt/init_workspace.bash
RUN echo 'echo -e "\e[32mplease run /opt/setup_workspace.bash to initialize the workspace\e[0m"' >> /opt/init_workspace.bash
RUN echo "echo" >> /opt/init_workspace.bash

# If you want to run the setup automatically, you can add it directly to the script
# it is executed every time the container is re-created
#RUN echo "/opt/setup_workspace.sh" >> /opt/init_workspace.sh







