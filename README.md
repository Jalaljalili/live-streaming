# live-streaming

## Install Nginx & ffmpeg
Need to Install these packages

```shell
apt-get install ffmpeg git zip build-essential libpcre3-dev libssl-dev zlib1g-dev

```

```shell
mkdir build

cd build/

git clone https://github.com/arut/nginx-rtmp-module.git

git clone https://github.com/nginx/nginx.git

cd nginx

./auto/configure --add-module=../nginx-rtmp-module

make && make install

wget https://raw.github.com/JasonGiedymin/nginx-init-ubuntu/master/nginx -O /etc/init.d/nginx && chmod +755 nginx

update-rc.d nginx defaults

/usr/local/nginx/sbin/nginx -t && nginx -s reload

cp /usr/local/nginx/conf/nginx.conf /usr/local/nginx/conf/nginx.conf.orginal

```
### Add Nginx config

```shell
> /usr/local/nginx/conf/nginx.conf
```
add new nginx.conf 

## Usage
```shell
 ./mp3-hls.sh SOURCE_FILE [OUTPUT_NAME]
 ./live-hls.sh SOURCE_FILE [OUTPUT_NAME]
 ./vod-hls.sh SOURCE_FILE [OUTPUT_NAME]
 ```