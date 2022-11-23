echo "0 4-23/8 * * * /bin/sh /root/youtube-dl.sh > /root/.config/youtube-dl.log" >> /etc/crontabs/root
crond -f