#!/bin/bash
set -e

command -v python3 >/dev/null || { echo "Python3 not found."; exit 1; }

export PATH="$HOME/.local/bin:$PATH"


if ! command -v ansible-playbook >/dev/null; then
  echo "Installing Ansible via pipx..."
  pipx install --include-deps ansible
fi

ansible-playbook -i inventory setup_k3s.yaml
ansible-playbook -i inventory setup_redpanda.yaml
