# diff-up-php
Server backend for generating and managing differential based backups using bsdiff.

## Guidance
The primary goal of diff-up is to reduce transmitted data between server and target. Through testing the following generally holds true:
* xz compression may be more efficient than a differential image
   * It may be more optimal to transfer the next version holistically, if that is the case a permanent redirect is transmitted and the next version returned using xz compression.
* The source files should not be compressed, nor the content contained within.
   * *.o - Use directly (best)
   * *.bin - Use directly
   * *.tar - Use directly
   * *.tgz - Convert to .tar
   * *.tar.gz - Convert to .tar
   * squashfs - Create uncompressed squashfs: mksquashfs <rfs> <rfs.sqfs> -noI -noD -noF -noappend -always-use-fragments
* Upon transmit, the file will be sent in one of two forms:
   * Differential update file, .bsdiff extension
   * Verbatim source image file with xz compression, .xz extension

## Setup
The diff-up server requires a couple PHP modules to enable the necessary functionality outlined above, if not supported in your version of PHP:
* [php-bsdiff](https://github.com/ajb042487/php-bsdiff)
* [php-xz](https://github.com/ajb042487/php-xz)
### Steps
* Install Apache and PHP if you have not already, or similar combination
* Download the two repos above, follow the README.md to install and enable the modules
* Check phpinfo() to verify the module bsdiff and xz are both enabled
