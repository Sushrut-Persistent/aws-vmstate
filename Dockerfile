FROM registry.access.redhat.com/ubi8/ubi-minimal

# Labels
LABEL name="aws-vmstate" \
    maintainer="sushrut.com" \
    vendor="sushrut" \
    version="1.0.0" \
    release="1" \
    summary="This service enables state management of AWS cloud vms." \
    description="This service enables state management AWS cloud vms."

# copy code to the build path
USER root
WORKDIR /opt
RUN chgrp -R 0 /opt && \
    chmod -R g=u /opt && \
    chmod +x -R /opt

USER 1001

# COPY go.* ./
COPY aws-vmstate aws-vmstate

# RUN go mod download
# RUN go build -o aws-vmstate
#RUN chmod +x /opt/aws-vmstate

CMD ["bash","-c","/opt/aws-vmstate "]