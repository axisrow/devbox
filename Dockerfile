FROM ubuntu:24.04
RUN apt-get update \
 && apt-get install -y --no-install-recommends curl git ca-certificates xz-utils sudo openssh-client \
 && curl -fsSL https://get.jetify.com/devbox | bash
USER root
CMD ["sleep", "infinity"]
