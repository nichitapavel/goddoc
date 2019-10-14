dd linux system backup
Create disk image copies with dd

Requirements:
  A usb/sd card where to store the image.

Instructions:

- Insert the usb/sd card and list disk devices:
    ```
    lsblk
    ```

- In case is not mounted, mount the usb/sd card.
  Create a temporary directory and mount the device there with read/write rights.
  Use the name from `lsblk` command to mount
    ```
    mktemp -d
    sudo mount -rw /dev/mmcblk0p1 /tmp/tmp.FoNPOnwiEW
    ```

- Make the disk image backup with dd:
    ```
    sudo dd if=/dev/mmcblk0 of=/tmp/tmp.FoNPOnwiEW/home/debian9-bbb.img status=progress; sync
    ```

- Unmount usb/sd card
    ```
    sudo umount /tmp/tmp.FoNPOnwiEW
    ```

