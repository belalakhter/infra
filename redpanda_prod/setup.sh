#!/bin/bash
set -e

command -v python3 >/dev/null || { echo "Python3 not found."; exit 1; }

command -v pipx >/dev/null || {
  python3 -m ensurepip --upgrade
  python3 -m pip install --user pipx
  export PATH="$HOME/.local/bin:$PATH"
  python3 -m pipx ensurepath
}

export PATH="$HOME/.local/bin:$PATH"

command -v ansible-playbook >/dev/null || pipx install --include-deps ansible

ansible-playbook -i inventory setup_k3s.yaml
ansible-playbook -i inventory setup_redpanda.yaml
