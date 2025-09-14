#!/bin/bash
sudo dnf update -y
sudo dnf install glibc-langpack-ja -y
timedatectl set-timezone Asia/Tokyo
localectl set-locale LANG=ja_JP.utf8


# https://docs.aws.amazon.com/ja_jp/linux/al2023/ug/ec2-lamp-amazon-linux-2023.html

# Apacheインストール
sudo dnf install -y httpd

#Apache起動設定
sudo systemctl start httpd
sudo systemctl enable httpd

#Session Manager用ユーザ事前作成
useradd -m -U ssm-user
echo "ssm-user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users

#ファイル書き込み権限割り当て
usermod -a -G apache ssm-user
chown -R ssm-user:apache /var/www
chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;

#Apache用indexファイル書き換え
echo $(hostname) > /var/www/html/index.html

# https://docs.aws.amazon.com/ja_jp/AmazonRDS/latest/UserGuide/CHAP_GettingStarted.CreatingConnecting.PostgreSQL.html

# PostgreSQLクライアントインストール
sudo dnf install postgresql15 -y
