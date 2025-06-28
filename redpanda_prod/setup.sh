#!/bin/bash
set -e

command -v python3 >/dev/null || { echo "Python3 not found."; exit 1; }

if ! command -v pip3 >/dev/null; then
  echo "Installing pip via get-pip.py..."
  wget https://bootstrap.pypa.io/get-pip.py -o get-pip.py
  python3 get-pip.py --user
  rm -f get-pip.py
  export PATH="$HOME/.local/bin:$PATH"
fi

if ! command -v pipx >/dev/null; then
  echo "Installing pipx..."
  python3 -m pip install --user pipx
  export PATH="$HOME/.local/bin:$PATH"
  python3 -m pipx ensurepath
fi

export PATH="$HOME/.local/bin:$PATH"


if ! command -v ansible-playbook >/dev/null; then
  echo "Installing Ansible via pipx..."
  pipx install --include-deps ansible
fi

ansible-playbook -i inventory setup_k3s.yaml
ansible-playbook -i inventory setup_redpanda.yaml
