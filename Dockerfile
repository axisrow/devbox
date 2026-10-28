FROM ubuntu:24.04
RUN apt-get update \
 && apt-get install -y --no-install-recommends curl git ca-certificates xz-utils sudo openssh-client \
 && curl -fsSL https://get.jetify.com/devbox | bash -s -- -f
RUN curl -fsSL -o /tmp/codex.tgz https://github.com/openai/codex/releases/download/rust-v0.165.0/codex-x86_64-unknown-linux-musl.tar.gz \
 && mkdir -p /tmp/codex-extract \
 && tar -xzf /tmp/codex.tgz -C /tmp/codex-extract \
 && install -m 0755 "$(find /tmp/codex-extract -type f -name codex | head -n 1)" /usr/local/bin/codex \
 && rm -rf /tmp/codex.tgz /tmp/codex-extract
USER root
CMD ["sleep", "infinity"]
