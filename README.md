# 📱 debain-and-android-studio-on-termux

> Install **Debian Linux**, **LXDE GUI**, and **Android Studio** inside **Termux** (no root needed) using a simple setup script.

---

## 💡 What's This?

This project lets you run **Android Studio** on your Android device using **Termux + proot-distro + VNC Viewer**. It sets up a full Debian environment with LXDE desktop and installs Android Studio (2025.1.1.21).

---

## 📥 Download and Run the Script

### 1. Open Termux and update:

pkg update && pkg upgrade -y pkg install git curl -y

### 2. Clone this repository:

git clone https://github.com/SoloFFcreator/debain-and-android-studio-on-termux.git cd debain-and-android-studio-on-termux

### 3. Make the installer executable:

chmod +x install-android-studio-termux.sh

### 4. Run the installer:

bash install-android-studio-termux.sh

---

## 🚀 How to Start Android Studio

After the script finishes:

Inside Termux:

proot-distro login debian vncserver :1 export DISPLAY=:1 /opt/android-studio/bin/studio.sh

OR just use the helper script below.

---

## ⚡ startstudio.sh (Optional Helper Script)

To launch Android Studio quickly from inside Debian:

#!/bin/bash export DISPLAY=:1 vncserver :1 /opt/android-studio/bin/studio.sh

Save this as `/root/startstudio.sh` inside Debian:

chmod +x /root/startstudio.sh ./startstudio.sh

---

## 📋 Requirements

- Android 8.0 or higher
- Termux (from F-Droid)
- 4–6 GB RAM recommended
- At least 5 GB free internal storage
- VNC Viewer app (for desktop GUI)

---

## 📺 How to View the GUI on Android

1. Open VNC Viewer app
2. Connect to `127.0.0.1:5901`
3. Enter password (set during first run of `vncserver`)
4. You’ll see Debian desktop with LXDE GUI
5. Launch Android Studio via terminal

---

## 🛠️ install-android-studio-termux.sh (Main Script)

```bash
#!/data/data/com.termux/files/usr/bin/bash

# debain-and-android-studio-on-termux
# Author: Solo FF | GitHub: https://github.com/SoloFFcreator/debain-and-android-studio-on-termux

# Step One: Install Debian in Termux
pkg update -y && pkg upgrade -y
pkg install proot-distro wget curl git -y

proot-distro install debian

# Step Two: Setup Debian Environment
cat << 'EOF' > ~/debian-setup.sh
#!/bin/bash

# Step Three: Install GUI and Android Studio in Debian
apt update && apt upgrade -y
apt install -y openjdk-17-jdk lxde tightvncserver wget curl git unzip sudo

dpkg --add-architecture i386
apt update
apt install -y lib32z1 libbz2-1.0:i386 libncurses5:i386 libc6:i386 libstdc++6:i386

cd /root
wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2025.1.1.21/android-studio-2025.1.1.21-linux.tar.gz
tar -xzf android-studio-*.tar.gz
mv android-studio /opt/

# Step Four: Configure VNC
echo 'export DISPLAY=:1' >> ~/.bashrc
echo 'vncserver :1' >> ~/.bashrc

echo "✅ Setup Complete!"
EOF

chmod +x ~/debian-setup.sh
proot-distro login debian -- bash /host-rootfs/data/data/com.termux/files/home/debian-setup.sh

echo "🎉 Debian and Android Studio are ready!"
echo "👉 Start with: proot-distro login debian"
echo "👉 Then: vncserver :1"
echo "👉 Then: /opt/android-studio/bin/studio.sh"


---

👨‍💻 Author

Solo FF
🔗 GitHub: SoloFFcreator
📅 Released: August 2025


---

⚖️ License

MIT License

Copyright (c) 2025 Solo FF

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

