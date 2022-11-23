#!/bin/sh

echo -e "\n ================ \n \\033[42;37m Rclone 统计已下载列表 \\033[0m \n ================ \n"

rclone lsf -R onedrive:/Actions | awk -F '/' 'match($2,/-[-0-9a-zA-Z_]{11}\.mkv/) {print "youtube "substr($2,RSTART+1,RLENGTH-5)}' >/root/.config/yt-dlp/archive.txt

echo -e "\n ================ \n \\033[42;37m yt-dlp 开始定时下载任务 \\033[0m \n ================ \n"

# yt-dlp 下载列表
/bin/sh /root/.config/RSS.sh
# RSS.sh 里每行一条 yt-dlp 命令，也可以注释掉上一行直接写在这里，比如：
# yt-dlp --dateafter today-3days --playlist-end 10 https://www.youtube.com/channel/UCvoQlzEzqa6vQA8hq9GNNug/videos

echo -e "\n ================ \n \\033[42;37m 清理未完成文件 \\033[0m \n ================ \n"

find /root/Actions -type f \! -name '*.mkv' -delete

echo -e "\n ================ \n \\033[42;37m Rclone 开始同步上传 \\033[0m \n ================ \n"

rclone copyto "/root/Actions/" "onedrive:Actions/" -P
rclone copyto "/root/.config/yt-dlp/archive.txt" "onedrive:Actions/archive.txt" -P

echo -e "\n ================ \n \\033[42;37m 单次循环结束 \\033[0m \n ================ \n"
# rm -rf /root/Actions/*
