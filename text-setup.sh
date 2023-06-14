#!/bin/bash

apt update
apt install libgl1 -yq
apt update && apt install -y nano libgl1 ffmpeg neofetch glances htop wget git python3 python3-venv pip ocl-icd-libopencl1 nvidia-cuda-toolkit hashcat hcxdumptool && ffmpeg -version
# Ngrok
#curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list && apt update && apt install ngrok
#https://ngrok.com/download
curl --header 'Host: bin.equinox.io' --user-agent 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:106.0) Gecko/20100101 Firefox/106.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' --header 'Accept-Language: en-US,en;q=0.5' --referer 'https://dashboard.ngrok.com/' --header 'Upgrade-Insecure-Requests: 1' --header 'Sec-Fetch-Dest: document' --header 'Sec-Fetch-Mode: navigate' --header 'Sec-Fetch-Site: cross-site' --header 'Sec-Fetch-User: ?1' 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz' --output 'ngrok-v3-stable-linux-amd64.tgz'

tar -xvzf ngrok-v3-stable-linux-amd64.tgz
mv ./ngrok /usr/bin/ngrok
# Ngrok 
#ngrok config add-authtoken NGROK_TOKEN_HERE
#echo "authtoken: NGROK_TOKEN_HERE" > /workspace/ngrok.yml

#cd /workspace/stable-diffusion-webui/
#bash webui.sh --xformers --api --share

cd /workspace/models/
git lfs install
git clone https://huggingface.co/TheBloke/Wizard-Vicuna-30B-Uncensored-GPTQ
git pull https://huggingface.co/TheBloke/Wizard-Vicuna-30B-Uncensored-GPTQ

cd /root/text-generation-webui/
cd extensions/
cd api/
pip install -r requirements.txt
cd ..
cd elevenlabs_tts/
pip install -r requirements.txt
cd ..
cd google_translate/
pip install -r requirements.txt
cd ..
cd silero_tts/
pip install -r requirements.txt
cd ..
cd whisper_stt/
pip install -r requirements.txt
cd ..
cd openai/
pip install -r requirements.txt
cd ..
cd superbooga/
pip install -r requirements.txt
cd ..
ls -la



###############################################################################################
apt-get clean

cd /root/text-generation-webui
sed -i 's/--api/--api --model TheBloke_Wizard-Vicuna-30B-Uncensored-GPTQ --model_type LLaMA --chat --wbits 4 --auto-devices --extensions long_term_memory whisper_stt silero_tts elevenlabs_tts llama_prompts sd_api_pictures/g' /workspace/run-text-generation-webui.sh
#python server.py --listen --api --model TheBloke_Wizard-Vicuna-30B-Uncensored-GPTQ --model_type LLaMA --chat --wbits 4 --auto-devices --extensions long_term_memory whisper_stt silero_tts elevenlabs_tts llama_prompts sd_api_pictures


#echo "bash -c /workspace/stable-diffusion-webui/start.sh"


#cd /workspace/stable-diffusion-webui/
#bash webui.sh --xformers --api --share

echo bash /restart-text-generation-webui.sh
sleep 10
source /restart-text-generation-webui.sh

echo YAY!!!!!!!!!!!
sleep 5
echo Dustin Did it!!!
sleep 6
echo Boop Boop
sleep 3
echo Press any key to Fuck Off!
exit 0
