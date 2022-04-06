FROM debian:11-slim

ENV SOPS_VERSION v3.7.2
ENV HELM_VERSION v3.8.1
ENV HELM_SECRETS_VERSION v3.11.0

RUN apt-get update && \
  apt-get install -y awscli curl git

# Install helm
RUN curl -Ss https://get.helm.sh/helm-$HELM_VERSION-linux-amd64.tar.gz -o /tmp/helm.tar.gz && \
  tar -xzf /tmp/helm.tar.gz -C /tmp && \
  mv /tmp/linux-amd64/helm /usr/bin/ && \
  rm -rf /tmp/linux-amd64 && \
  helm plugin install https://github.com/jkroepke/helm-secrets --version $HELM_SECRETS_VERSION

# Install SOPS
RUN curl -SsL https://github.com/mozilla/sops/releases/download/$SOPS_VERSION/sops-$SOPS_VERSION.linux.amd64 -o /usr/bin/sops && \
  chmod +x /usr/bin/sops

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
