#!/bin/bash
# Setup Gitlab Runner, version 1

# INSTALL RUNNER
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
apt install gitlab-runner

# INSTALL DOCKER-COMPOSE
curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# INSTALL DOCKER
apt install containerd docker.io
docker version
usermod -aG docker gitlab-runner

gitlab-runner register \
--detach \
--restart always \
--non-interactive \
--url "https://gitlab.url.com/" \
--registration-token "REGISTRATION_TOKEN" \
--executor "shell" \
--name gitlab-runner-uschi \
--description "uschi-prod" \
--tag-list "uschi,shell,prod,docker-daemon" \
--run-untagged="false" \
--locked="false" \
--access-level="not_protected"
