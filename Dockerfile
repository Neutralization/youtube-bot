FROM alpine:latest
RUN apk add --no-cache python3 yt-dlp ffmpeg rclone
COPY ["*.sh", "/root"]
RUN chmod 0644 /root/youtube-dl.sh

ENTRYPOINT  ["/bin/sh", "/root/entrypoint.sh"]