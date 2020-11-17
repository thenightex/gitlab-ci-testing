#!/bin/bash
# Setup Gitlab Runner, version 1

# INSTALL BREW
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# INSTALL RUNNER
brew install gitlab-runner
brew services start gitlab-runner

# INSTALL DOCKER
brew install docker

# INSTALL DOCKER-COMPOSE
brew install docker-compose

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
