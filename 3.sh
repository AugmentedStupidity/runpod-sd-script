#!/bin/bash

apt update
apt install libgl1 -yq
apt update && apt install -y nano ffmpeg neofetch glances htop wget git python3 python3-venv pip ocl-icd-libopencl1 #nvidia-cuda-toolkit hashcat hcxdumptool && ffmpeg -version
# Ngrok
#curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list && apt update && apt install ngrok
#https://ngrok.com/download
curl --header 'Host: bin.equinox.io' --user-agent 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:106.0) Gecko/20100101 Firefox/106.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' --header 'Accept-Language: en-US,en;q=0.5' --referer 'https://dashboard.ngrok.com/' --header 'Upgrade-Insecure-Requests: 1' --header 'Sec-Fetch-Dest: document' --header 'Sec-Fetch-Mode: navigate' --header 'Sec-Fetch-Site: cross-site' --header 'Sec-Fetch-User: ?1' 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz' --output 'ngrok-v3-stable-linux-amd64.tgz'
tar -xvzf ngrok-v3-stable-linux-amd64.tgz
mv ./ngrok /usr/bin/ngrok
# Ngrok Token
#ngrok config add-authtoken NGROK_TOKEN_HERE
#echo "authtoken: NGROK_TOKEN_HERE" > /workspace/ngrok.yml
# 
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git /workspace/stable-diffusion-webui/
# 
wget https://huggingface.co/Linaqruf/anything-v3.0/resolve/main/anything-v3-fp16-pruned.safetensors -O /workspace/stable-diffusion-webui/models/Stable-diffusion/anything-v3-fp16-pruned.safetensors
# VAE 
wget https://huggingface.co/hakurei/waifu-diffusion-v1-4/resolve/main/vae/kl-f8-anime2.ckpt -O /workspace/stable-diffusion-webui/models/VAE/kl-f8-anime2.ckpt
# EasyNegative 
wget https://huggingface.co/datasets/gsdf/EasyNegative/resolve/main/EasyNegative.safetensors -O /workspace/stable-diffusion-webui/embeddings/EasyNegative.safetensors
# 
git clone https://github.com/DominikDoom/a1111-sd-webui-tagcomplete.git /workspace/stable-diffusion-webui/extensions/a1111-sd-webui-tagcomplete/
# venv
#python -m venv /workspace/stable-diffusion-webui/venv --without-pip
#python -m venv /workspace/stable-diffusion-webui/venv
# venv activate
#source /workspace/stable-diffusion-webui/venv/bin/activate
#source /workspace/stable-diffusion-webui/venv/bin/activate
#curl https://bootstrap.pypa.io/get-pip.py | python
# 
#python -m pip install -r /workspace/stable-diffusion-webui/requirements_versions.txt
#python -m pip install -r /workspace/stable-diffusion-webui/requirements.txt

# start.sh 
wget https://raw.githubusercontent.com/AugmentedStupidity/runpod-sd-script/main/start-sd.sh -O /workspace/stable-diffusion-webui/start-sd.sh
wget https://raw.githubusercontent.com/AugmentedStupidity/runpod-sd-script/main/continue.sh -O /workspace/stable-diffusion-webui/continue.sh
chmod +x /workspace/stable-diffusion-webui/start-sd.sh
chmod +x /workspace/stable-diffusion-webui/continue.sh
# 
###############################################################################################

cd /workspace/stable-diffusion-webui/models/Stable-diffusion
#git lfs install
#git clone https://huggingface.co/prompthero/openjourney-v4
#git pull https://huggingface.co/prompthero/openjourney-v4
wget https://huggingface.co/prompthero/openjourney-v4/resolve/main/openjourney-v4.ckpt

# https://huggingface.co/SG161222/Realistic_Vision_V1.4
#git lfs install
#git clone https://huggingface.co/SG161222/Realistic_Vision_V1.4
#git pull https://huggingface.co/SG161222/Realistic_Vision_V1.4
#cd /workspace/stable-diffusion-webui/models/Stable-diffusion/Realistic_Vision_V1.4
#rm Realistic_Vision_V1.4-*
#rm Realistic_Vision_V1.4.safetensors

#cd /workspace/stable-diffusion-webui/
#bash webui.sh --xformers --api --share

#cd /workspace/models/
#git lfs install
#git clone https://huggingface.co/TheBloke/Wizard-Vicuna-30B-Uncensored-GPTQ
#git pull https://huggingface.co/TheBloke/Wizard-Vicuna-30B-Uncensored-GPTQ

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


#=================================
sed -i "/#fi/i \n
alias restartob='bash /restart-text-generation-webui.sh' \
alias editmodel='nano /workspace/run-text-generation-webui.sh' \
alias restartsd='bash /workspace/stable-diffusion-webui/webui.sh --xformers --api --share' \
alias aliasedit='nano ~/.bashrc' \
alias aliasreload='source ~/.bashrc' \
alias pkill='kill -9' \
alias netdatainstall='wget -O /tmp/netdata-kickstart.sh https://my-netdata.io/kickstart.sh && sh /tmp/netdata-kickstart.sh --nightly-channel --claim-token KvsmT6WV9cuYelOVZ-CEJtIkoUkleSlI2qtSzwBOB0f7InqJFOv_ZSholDuzxk-3dtoeOsJM8Ky3RJ9j7ubgKgK1MrwbNkmEDNaTPEsUKcoA1XuMTBgafROPKf5lS-KubYeLDp8 --claim-rooms 08add65d-2e24-4137-b1cc-ad05f57e9dcd --claim-url https://app.netdata.cloud' \n
alias netdatastart='service netdata restart
alias netdatarestart='service netdata restart'/g" /root/.bashrc

#source ~/.bashrc

#alias restart='bash /restart-text-generation-webui.sh'
#alias editmodel='nano /workspace/run-text-generation-webui.sh'
#alias restartsd='bash /workspace/stable-diffusion-webui/webui.sh --xformers --api --share'
#alias aliasedit='nano ~/.bashrc'
#alias aliasreload='source ~/.bashrc'
#alias pkill='kill -9'
#alias netdatainstall='wget -O /tmp/netdata-kickstart.sh https://my-netdata.io/kickstart.sh && sh /tmp/netdata-kickstart.sh --nightly-channel --claim-token KvsmT6WV9cuYelOVZ-CEJtIkoUkleSlI2qtSzwBOB0f7InqJFOv_ZSholDuzxk-3dtoeOsJM8Ky3RJ9j7ubgKgK1MrwbNkmEDNaTPEsUKcoA1XuMTBgafROPKf5lS-KubYeLDp8 --claim-rooms 08add65d-2e24-4137-b1cc-ad05f57e9dcd --claim-url https://app.netdata.cloud'
#alias netdatarestart='service netdata restart'
#source ~/.bashrc

#=================================

###############################################################################################
apt-get clean
sed -i 's/can_run_as_root=0/can_run_as_root=1/g' /workspace/stable-diffusion-webui/webui.sh
echo "bash -c /workspace/stable-diffusion-webui/start-sd.sh"
echo "bash -c /workspace/stable-diffusion-webui/continue.sh"

cd /workspace/stable-diffusion-webui/
bash webui.sh --xformers --api --share

echo YAY!!!!!!!!!!!
sleep 5
echo Dustin Did it!!!
sleep 6
echo Boop Boop
sleep 3
echo Press any key to Fuck Off!
exit 0
