#!/bin/bash
sudo dnf update -y
sudo dnf install glibc-langpack-ja -y
timedatectl set-timezone Asia/Tokyo
localectl set-locale LANG=ja_JP.utf8
