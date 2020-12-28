# General Description

Some Western Digital (WD) external hard-drives have a built-in encryption mechanism that requires a special software called "WD Security". Unfortunately, the "WD Security" software supports only MS-Windows and Macintosh, so the people who have one or more of those WD hard-drives are always left disappointed whenever they try to access their encrypted WD hard-drives using their favourite GNU/Linux distribution. However, a decryption mechanism which supports most GNU/Linux distributions was fortunately discovered for those WD hard-drives, in a way that does not require the infamous "WD Security" software at all. This repository mainly contains the aforementioned decryption mechanism. For more details, refer to the tutorial presented in this Youtube video: https://youtu.be/Qz51UelzByA

# Files

* [On_the_(in)security_of_a_Self-Encrypting_Drive_series.pdf](https://github.com/IbrahimTouman/WD-Decrypte/blob/master/On_the_(in)security_of_a_Self-Encrypting_Drive_series.pdf) & [WD_Encryption_API.txt](https://github.com/IbrahimTouman/WD-Decrypte/blob/master/WD_Encryption_API.txt) -> both contain information about the API and the algorithms used for the encryption process
* [cookpw.py](https://github.com/IbrahimTouman/WD-Decrypte/blob/master/cookpw.py) -> a Python script-file which generates an important .BIN file (40 bytes)
* [WDdecrypt.sh](https://github.com/IbrahimTouman/WD-Decrypte/blob/master/WDdecrypt.sh) -> a Bash script-file which automates the entire decryption mechanism in a nice and interactive way

# Contributions

First of all, this repository is forked, so all credit goes to the original author [SofianeHamlaoui](https://github.com/SofianeHamlaoui). The reason behind why I ([IbrahimTouman](https://github.com/IbrahimTouman)) forked this repository is that I wanted to share my useful contribution which adds to the work of the original author. I found out that the work of the original author involves carrying out so many steps before a successful result is reached. Therefore, I created a simple Bash script ([WDdecrypt.sh](https://github.com/IbrahimTouman/WD-Decrypte/blob/master/WDdecrypt.sh)) which automates the entire procedure in a nice and interactive way.

# Deployment

Please follow these 8 simple steps:

* If you don't have it already, go ahead and install `sg_raw`. You can download it at any time from: http://sg.danny.cz/sg/sg3_utils.html
* If you don't have it already, then go ahead and download this Python script-file [cookpw.py](https://github.com/IbrahimTouman/WD-Decrypte/blob/master/cookpw.py)
* Also, if you don't have it already, then go ahead and download this Bash script-file [WDdecrypt.sh](https://github.com/IbrahimTouman/WD-Decrypte/blob/master/WDdecrypt.sh)
* Put the `WDdecrypt.sh` Bash script-file together with the `cookpw.py` Python script-file in the same directory, navigate to that directory in a terminal emulator, and then type: `sudo ./WDdecrypt.sh` (you can omit the "sudo" if you want)
* In case the `cryptsetup` package does not exist already in your system, the Bash script will prompt you to install it (you must agree with that and allow the installation process to proceed till the end). Unfortunately, you might face some trouble in this step if you are not running a debian-based distribution, however, the solution is simple, which is to manually install the `cryptsetup` package before you execute the Bash script
* Give the system location and password of your WD drive when prompted to do so by the Bash script (for security reasons, your password is not stored at all)
* Enjoy the experience of having your encryption-capable external WD hard-drive fully functional in your favourite GNU/Linux distro
* Finally, do not forget to always stay safe from covid-19

# Authors
* **Sofiane Hamlaoui** - *original author* - [SofianeHamlaoui](https://github.com/SofianeHamlaoui)
* **Ibrahim Touman** - *contributor* - [IbrahimTouman](https://github.com/IbrahimTouman)

# License

This work is licensed under the MIT license - see the [LICENSE](https://github.com/IbrahimTouman/WD-Decrypte/blob/master/LICENSE) file for details
