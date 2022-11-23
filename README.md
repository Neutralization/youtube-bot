# youtube to onedrive

自用的 YouTube RSS 脚本，定时下载指定的 YouTube 频道视频更新。

## 配置

- 配置 [Rclone](https://rclone.org/install/)

> curl `https://rclone.org/install.sh` | sudo bash  
> rclone config  
> rclone mkdir onedrive:/Actions

配置文件在 `~/.config/rclone/rclone.conf`

- 配置 [yt-dlp](https://github.com/yt-dlp/yt-dlp#configuration)

编辑配置文件 `~/.config/yt-dlp/config`

```conf
--force-ipv4
--output /root/Actions/%(uploader)s/[%(upload_date)s][%(width)sP]%(title)s-%(id)s.%(ext)s
--cookies /root/.config/yt-dlp/cookie.txt
--download-archive /root/.config/yt-dlp/archive.txt
--continue
--no-warnings
--no-check-certificate
--format bestvideo+bestaudio
--merge-output-format mkv
```

其他配置参考 yt-dlp 的文档

- 安装 [Docker](https://docs.docker.com/get-docker/)

## 部署

> git clone `https://github.com/Neutralization/youtube-bot.git`  
> cd youtube-bot && mkdir Actions  
> cp -r ~/.config ./.config  
> docker build -t youtube-bot:beta .  
> docker compose up -d  
