#!/bin/bash
set -e

export LANG=C.UTF-8
export LC_ALL=C.UTF-8
export PATH="$HOME/.local/bin:$PATH"

command -v python3 >/dev/null || { echo "Python3 not found."; exit 1; }



if ! command -v ansible-playbook >/dev/null; then
  echo "Installing Ansible via pipx..."
  pipx install --include-deps ansible
fi

ansible-playbook -i inventory setup_k3s.yaml
ansible-playbook -i inventory setup_redpanda.yaml
