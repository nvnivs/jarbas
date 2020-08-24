function patch_arch {
  # Update
  sudo pacman -Syu --noconfirm

  # Clean
  sudo pacman -Sc --noconfirm

  # Check if reboot is required
  NEXTLINE=0
  FIND=""
  for I in `file /boot/vmlinuz*`; do
    if [ ${NEXTLINE} -eq 1 ]; then
      FIND="${I}"
      NEXTLINE=0
    else
      if [ "${I}" = "version" ]; then NEXTLINE=1; fi
    fi
  done
  if [ ! "${FIND}" = "" ]; then
    CURRENT_KERNEL=`uname -r`
    if [ ! "${CURRENT_KERNEL}" = "${FIND}" ]; then
      echo "Kernel has been patched, rebooting in 5..."
      sleep 5
      sudo reboot now
    fi
  fi
}
