`sudo systemctl daemon-reload`

`sudo systemctl status rail`

`sudo systemctl start rail`

`sudo journalctl -u rail.service`

`vi /home/deploy/app/shared/start.sh`

`sudo vi /etc/systemd/system/rail.service`

`sudo visudo`

`deploy ALL=(ALL) NOPASSWD: /bin/systemctl restart rail.service`

# Set up systemd /etc/systemd/system/rail.service