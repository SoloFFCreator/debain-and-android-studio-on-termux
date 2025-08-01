


---

# Debian and Android Studio on Termux

**Author:** [SoloFFcreator](https://github.com/SoloFFcreator)  
**Repository:** `debain-and-android-studio-on-termux`  
**License:** MIT

This project provides a simple method to install Debian and run Android Studio on Termux (Android). It includes necessary setup scripts and instructions for VNC access.

---

## 📦 Requirements

- Android device (preferably with 4GB+ RAM)
- Installed Termux (from [F-Droid](https://f-droid.org/en/packages/com.termux/))
- Stable Internet connection
- 6-10 GB of free storage
- Patience 😄

---

## ⚙️ Termux Setup Commands

Run these commands one by one in your Termux terminal:



```bash


---

pkg update && pkg upgrade -y

---




---
pkg install wget proot-distro git -y

---




## 📥 Download and Run Setup Script



Clone this repository and execute the setup:




---
git clone https://github.com/SoloFFcreator/debain-and-android-studio-on-termux.git

---


---
cd debain-and-android-studio-on-termux

---


---

chmod +x startstudio.sh convert.sh

---


---

./startstudio.sh

--





## 🧰 Files in This Repo:


---
startstudio.sh
---



 – Script to set up and launch Android Studio in Debian




---
convert.sh
---




 – Optional helper script for additional setup or tweaks








## README.md – You're reading it now!





## 🖥️ Start Android Studio

Once Debian is installed:



---
proot-distro login debian
cd /root
./startstudio.sh

---



Access GUI with VNC Viewer:



Install any VNC Viewer from Play Store (like RealVNC)



Connect to: localhost:1 or 127.0.0.1:5901




Password: (what you set during VNC install)









## 📌 Notes

If Android Studio fails to launch, try running ./convert.sh inside Debian.

First boot might take a few minutes.







## 📄 License



This project is licensed under the MIT License. See LICENSE for details.




## 🙏 Credits

Made with 💻 by SoloFFcreator
Inspired by various open-source Linux-on-Android tutorials.



