sudo pvresize /dev/mmcblk0p3
sudo lvextend /dev/mapper/fedora-root -l +100%FREE
sudo xfs_growfs /