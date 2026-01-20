#!/bin/bash
case $SSH_ORIGINAL_COMMAND in
# Permit scp when run in internal source/dest/dir mode
# NOTE: adding path does not protect from rogue symlinks
 "scp -f $HOME/"*)
    $SSH_ORIGINAL_COMMAND
    ;;
 "scp -t $HOME/"*)
    $SSH_ORIGINAL_COMMAND
    ;;
 "scp -d $HOME"*)
    $SSH_ORIGINAL_COMMAND
    ;;
# Permit standard sftp - by pats, as `internal-sftp` works only in sshd_config
 "/usr/lib/openssh/sftp-server")
    $SSH_ORIGINAL_COMMAND
    ;;
# Drop anything else
 *)
    echo "Access Denied"
    ;;
esac