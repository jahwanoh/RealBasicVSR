pip3 install gdown && gdown https://drive.google.com/uc?id=1OYR1J2GXE90Zu2gVU5xc0t0P_UmKH7ID

docker build -t realbasicvsr .

echo "docker run -it --gpus all -v $(pwd)/data:/app/data -v $(pwd)/results:/app/results realbasicvsr"