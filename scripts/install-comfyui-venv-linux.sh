git clone https://github.com/comfyanonymous/ComfyUI
cd ComfyUI/custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager
cd ..
# python -m venv venv
# source venv/bin/activate
python -m pipenv install --pre torch torchvision torchaudio -i pytorch_cuda --system
python -m pipenv install --pre -vr requirements.txt -i pytorch_cuda --system
python -m pipenv install --pre -vr custom_nodes/comfyui-manager/requirements.txt -i pytorch_cuda --system
cd ..
echo "#!/bin/bash" > run_gpu.sh
echo "cd ComfyUI" >> run_gpu.sh
echo "source venv/bin/activate" >> run_gpu.sh
echo "python main.py --preview-method auto" >> run_gpu.sh
chmod +x run_gpu.sh

echo "#!/bin/bash" > run_cpu.sh
echo "cd ComfyUI" >> run_cpu.sh
echo "source venv/bin/activate" >> run_cpu.sh
echo "python main.py --preview-method auto --cpu" >> run_cpu.sh
chmod +x run_cpu.sh
