#!/bin/bash

#Syncing files
#Take this credentials from the backuped file at your aws account
aws configure

aws s3 sync s3://ll1rro-forbackups/Backup /home/ll1rro


#Installing all neccessary packages
dnf update --refresh -y

#Import rpm free and nonfree rpm fusion packages
dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#Install nvidia drivers
dnf install akmod-nvidia -y
dnf install xorg-x11-drv-nvidia-cuda

#Setting up nvidia to change default opengl provider
dnf install gcc kernel-headers kernel-devel akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-libs.i686
read -p "Time to load kernel modules. ETA 5m" -t 60
read -p "Time to load kernel modules. ETA 4m" -t 60
read -p "Time to load kernel modules. ETA 3m" -t 60
read -p "Time to load kernel modules. ETA 2m" -t 60
read -p "Time to load kernel modules. ETA 1m" -t 60
echo "Kernel modules must be loaded already"

#Edit x11 configuration
dnf install xrandr
cp -p /usr/share/X11/xorg.conf.d/nvidia.conf /etc/X11/xorg.conf.d/nvidia.conf
sed -i 's/Option "PrimaryGPU" "no"/Option "PrimaryGPU" "yes"/g' /etc/X11/xorg.conf.d/nvidia.conf


#Installling all required packages for me
dnf install steam google-chrome-stable flatpak

#Configuring flatpak and installing flatpak packages
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install zoom firefox spotify slack

#Finally rebooting system
reboot
