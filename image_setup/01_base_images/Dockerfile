ARG BASE_IMAGE

FROM ${BASE_IMAGE}

ARG INSTALL_SCRIPT
ARG INSTALL_ARGS

LABEL description="This image was generated to be a base image for docker_image_development"
LABEL dockerfile_repo_url="https://github.com/dfki-ric/docker_image_development"
LABEL maintainer="DFKI RIC"

ADD prepare_image.bash check_init_workspace.bash init_user_id.bash VERSION entrypoint.bash /opt/
ADD ${INSTALL_SCRIPT} /opt/install.bash

#these scripts must be runnable by users, not only root
RUN chmod 755 /opt/prepare_image.bash /opt/entrypoint.bash /opt/init_user_id.bash /opt/check_init_workspace.bash /opt/install.bash
RUN /opt/prepare_image.bash

ENV LANG=en_US.UTF-8  LANGUAGE=en_US:en LC_ALL=en_US.UTF-8 SHELL=/bin/bash PATH="/opt/startscripts:${PATH}"

WORKDIR /opt/workspace

ENTRYPOINT ["/opt/entrypoint.bash"]

# the entrypoint converts this to /bin/bash
CMD ["init_container"]

RUN /opt/install.bash ${INSTALL_ARGS}
