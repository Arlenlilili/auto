#!/bin/bash

DEVICE="/dev/vdb"

PARTITION_NUMBER=1

MOUNT_POINT="/data"

sudo fdisk $DEVICE <<EOF
n
p
$PARTITION_NUMBER

w
EOF

sudo mkfs.ext4 ${DEVICE}${PARTITION_NUMBER}

sudo mkdir -p $MOUNT_POINT

sudo mount ${DEVICE}${PARTITION_NUMBER} $MOUNT_POINT

echo "${DEVICE}${PARTITION_NUMBER} $MOUNT_POINT ext4 defaults 0 2" | sudo tee -a /etc/fstab

echo "New partition has been created, formatted, and mounted at $MOUNT_POINT."