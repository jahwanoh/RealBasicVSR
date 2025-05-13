FROM pytorch/pytorch:2.1.0-cuda12.1-cudnn8-runtime

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    wget \
    ffmpeg \
    libsm6 \
    libxext6 \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . /app/

# Install Python dependencies
RUN pip install --no-cache-dir \
    openmim \
    && mim install mmcv-full \
    && pip install --no-cache-dir mmedit

# Create directory for checkpoints
RUN mkdir -p checkpoints

# Optional: Download pre-trained weights
# Uncomment the following line to download weights during build
# RUN wget -O checkpoints/RealBasicVSR.pth https://www.dropbox.com/s/eufigxmmkv5woop/RealBasicVSR.pth?dl=1

# Set entrypoint to bash
ENTRYPOINT ["/bin/bash"] 