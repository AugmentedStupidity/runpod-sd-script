#!/bin/bash

# 
if dpkg-query -W libgl1 2>/dev/null | grep -q "libgl1"; then
  echo -n ""
else
  echo "libgl1 is not installed. Installing..."
  apt update
  apt install -yq libgl1
fi

if [[ -z "${VIRTUAL_ENV}" ]]; then
  echo "python venv."
  source /workspace/stable-diffusion-webui/venv/bin/activate
else
  echo "venv ."
fi

# 
python /workspace/stable-diffusion-webui/launch.py --listen --xformers --share

deactivate
echo "Deactivated."
