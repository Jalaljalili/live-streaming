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

wget https://raw.github.com/JasonGiedymin/nginx-init-ubuntu/master/nginx -O /etc/init.d/nginx && chmod +755 /etc/init.d/nginx

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
 ## Sets the logo at the top right of the video
The script creates an "output" directory. It also overlays the PNG logo file on the video using FFmpeg's overlay filter.
The script sets the logo_pos variable to "main_w-overlay_w-10:10", which positions the logo at the top right corner of the video, with a 10-pixel margin from the right and top edges.
The output files are named "output.m3u8" that contains all the different bitrates. The playlist file is written in the "output" directory.
*  To run the script, save it to a file (e.g. "set-logo.sh"), make it executable with chmod +x set-logo.sh, and run it with 
```shell
./set-logo.sh
```
