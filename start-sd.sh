#!/bin/bash

ngrok config add-authtoken NGROK_TOKEN_HERE
echo "authtoken: NGROK_TOKEN_HERE" > /workspace/ngrok.yml
# 
#if dpkg-query -W libgl1 2>/dev/null | grep -q "libgl1"; then
#  echo -n ""
#else
#  echo "libgl1 is not installed. Installing..."
#  apt update
#  apt install -yq libgl1
#fi

# 
#if dpkg-query -W ngrok 2>/dev/null | grep -q "ngrok"; then
#  echo -n ""
#else
#  echo "ngrok is not installed. Installing..."
#  curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list && apt update && apt install ngrok
cp /workspace/ngrok.yml /root/.config/ngrok/ngrok.yml
#fi

#if [[ -z "${VIRTUAL_ENV}" ]]; then
#  echo "python venv."
#  source /workspace/stable-diffusion-webui/venv/bin/activate
#else
#  echo "venv . ."
#fi

nohup ngrok http 7861 --log=stdout &> /dev/null &

NGROK_PUBLIC_URL=""
while [ -z "$NGROK_PUBLIC_URL" ]; do
  # Run 'curl' against ngrok API and extract public (using 'sed' command)
  export NGROK_PUBLIC_URL=$(curl --silent --max-time 10 --connect-timeout 5 \
                            --show-error http://127.0.0.1:4040/api/tunnels | \
                            sed -nE 's/.*public_url":"https:..([^"]*).*/\1/p')
  sleep 1
  echo -n "."
done

function start_webui {
  local message=${1}
  local duration=${2}
  local columns=$(tput cols)
  local spacing=$(( $columns / 3 ))
  local progress=$(echo "scale=2; $spacing/$duration" | bc)
  local i=0
  while true
  do
    echo -ne "\Ngrok: https://${message}/\e[0m"
    local count=0
    while [ $count -lt $spacing ]
    do
      #echo -n ""
      (( count ++ ))
    done
    #echo -n ""
    local j=0
    while [ $j -lt $i ]
    do
      #echo -n ""
      (( j ++ ))
    done
    echo -ne "\r" >&2 #
    sleep 1
    (( i ++ ))
    if [ $i -eq $duration ]
    then
      i=0
    fi
  done
}

#
start_webui "${NGROK_PUBLIC_URL}" 1 &
#python /workspace/stable-diffusion-webui/launch.py --listen --xformers --share

#bash /workspace/stable-diffusion-webui/webui.sh --xformers --api --share

# 
#kill $!
#kill -9 $(ps -ef | grep 'ngrok' | grep -v 'grep' | awk '{print $2}')
#deactivate
#echo "ngrok stopped"
#echo "."
