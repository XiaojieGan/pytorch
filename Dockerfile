FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-devel

RUN apt-get update && apt-get install -y libgl1-mesa-glx libpci-dev curl nano psmisc zip git && apt-get --fix-broken install -y

RUN conda install -y faiss-gpu scikit-learn pandas flake8 yapf isort yacs gdown future libgcc -c conda-forge

RUN pip install --upgrade pip && python -m pip install --upgrade setuptools && \
    pip install opencv-python tb-nightly matplotlib logger_tt tabulate tqdm wheel mccabe scipy && \
    pip install torch==1.9.0+cu111 torchvision==0.10.0+cu111 torchaudio==0.9.0 -f https://download.pytorch.org/whl/torch_stable.html && \
    pip install langchain scipy ftfy==6.0.3 regex tqdm omegaconf pytorch-lightning==1.3.7.post0 IPython kornia==0.5.4 imageio imageio-ffmpeg einops torch_optimizer setuptools==59.5.0 torchmetrics==0.3.2

COPY ./fonts/* /opt/conda/lib/python3.10/site-packages/matplotlib/mpl-data/fonts/ttf/
