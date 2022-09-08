docker run -p 19000:9000 --name minio \
  -v /mnt/data:/data \
  -v /mnt/config:/root/.minio \

  --log-driver=gelf \
  --log-opt gelf-address=udp://192.1:12201 \ 
  --log-opt tag=minio \

  minio/minio server /data
