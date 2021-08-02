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

Other commands with dd:
- disk throughput [1]:
  `dd if=/dev/zero of=/tmp/test1.img bs=1G count=1 oflag=dsync`
- disk latency [1]:
  `dd if=/dev/zero of=/tmp/test2.img bs=512 count=1000 oflag=dsync`


REFERENCES:
[1] - https://www.cyberciti.biz/faq/howto-linux-unix-test-disk-performance-with-dd-command/