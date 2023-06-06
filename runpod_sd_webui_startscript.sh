#!/bin/bash

apt update
# apt install libgl1 -yq
apt update && apt install -y nano ffmpeg neofetch glances htop wget git python3 python3-venv ocl-icd-libopencl1 nvidia-cuda-toolkit hashcat hcxdumptool && ffmpeg -version
# Ngrok
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list && apt update && apt install ngrok
# Ngrok 
ngrok config add-authtoken NGROK_TOKEN_HERE
echo "authtoken: NGROK_TOKEN_HERE" > /workspace/ngrok.yml
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
python -m venv /workspace/stable-diffusion-webui/venv --without-pip
# venv activate
source /workspace/stable-diffusion-webui/venv/bin/activate
curl https://bootstrap.pypa.io/get-pip.py | python
# 
python -m pip install -r /workspace/stable-diffusion-webui/requirements_versions.txt
# start.sh 
wget https://gist.github.com/panta5/b0cbddee37d6839561ad1b6a2d353a5b/raw/start.sh -O /workspace/stable-diffusion-webui/start.sh
wget https://gist.githubusercontent.com/panta5/6239382f45a773d75a9788efd1c940a9/raw/continue.sh -O /workspace/stable-diffusion-webui/continue.sh
chmod +x /workspace/stable-diffusion-webui/start.sh
chmod +x /workspace/stable-diffusion-webui/continue.sh
# 
###############################################################################################

cd /workspace/stable-diffusion-webui/models/Stable-diffusion
#git lfs install
#git clone https://huggingface.co/prompthero/openjourney-v4

# https://huggingface.co/SG161222/Realistic_Vision_V1.4
git lfs install
git clone https://huggingface.co/SG161222/Realistic_Vision_V1.4

cd /workspace/stable-diffusion-webui/models/Stable-diffusion/Realistic_Vision_V1.4
rm Realistic_Vision_V1.4-*
#rm Realistic_Vision_V1.4.safetensors

#cd /workspace/stable-diffusion-webui/
#bash webui.sh --xformers --api --share

wget -O /tmp/netdata-kickstart.sh https://my-netdata.io/kickstart.sh && sh /tmp/netdata-kickstart.sh --nightly-channel --claim-token KvsmT6WV9cuYelOVZ-CEJtIkoUkleSlI2qtSzwBOB0f7InqJFOv_ZSholDuzxk-3dtoeOsJM8Ky3RJ9j7ubgKgK1MrwbNkmEDNaTPEsUKcoA1XuMTBgafROPKf5lS-KubYeLDp8 --claim-rooms 08add65d-2e24-4137-b1cc-ad05f57e9dcd --claim-url https://app.netdata.cloud

#service netdata restart

cd ~/text-generation-webui/
&&
cd extensions/
&&
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

alias restart='bash /restart-text-generation-webui.sh'
alias editmodel='nano /workspace/run-text-generation-webui.sh'
alias restartsd='bash /workspace/stable-diffusion-webui/webui.sh --xformers --api --share'
alias aliasedit='nano ~/.bashrc'
alias aliasreload='source ~/.bashrc'
alias pkill='kill -9'
alias restartnetdata='service netdata restart'
source ~/.bashrc

#=================================

###############################################################################################
apt-get clean
sed -i 's/can_run_as_root=0/can_run_as_root=1/g' /workspace/stable-diffusion-webui/webui.sh
echo -e "/workspace/stable-diffusion-webui/start.sh"
echo -e "\n\e[42;1;31mbash -c \"cd /workspace/stable-diffusion-webui \&\& ./continue.sh\"\e[0m "

cd /workspace/stable-diffusion-webui/
#bash webui.sh --xformers --api --share

echo YAY!!!!!!!!!!!
sleep 5
echo Dustin Did it!!!
sleep 6
echo Boop Boop
sleep 3
echo Press any key to Fuck Off!
exit 0
