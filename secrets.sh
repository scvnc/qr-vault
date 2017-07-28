#!/bin/bash
#
# Combines 4 QR-Codes containing a base64 string into a file.
# Uses your webcam.
# Mounts a tmpfs

set -e
umask 077

VAULT_DIR=$HOME/.vault

# Requires zbar
test $(zbarcam --version) || { 
    exit 1
}

# Arch compat for zbar
export LD_PRELOAD=/usr/lib/libv4l/v4l1compat.so


mkdir -p ${VAULT_DIR}

# Mount tmpfs
if ! (mount |grep "${VAULT_DIR}" > /dev/null) ; then 
    echo Mounting ramdisk.
    sudo mount -t tmpfs -o size=5m tmpfs ${VAULT_DIR}
fi

function getQR () {
    
     zbarcam | {
        while read line; do 
            echo $line | sed s/QR-Code:// | base64 -d
            killall zbarcam 
        done
    }
    
}

key=''
function getKeyFragment () {
    mkdir -p key_fragments
    
    echo "Press Enter to begin capture of key fragment"
    read
    key=${key}$(getQR)
}

# Hardcoded for 4 fragments
getKeyFragment
getKeyFragment
getKeyFragment
getKeyFragment

echo ${key} > ${VAULT_DIR}/qr-code-result.dat
