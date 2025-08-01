#install debain-and-android-studio-termux.sh

#!/data/data/com.termux/files/usr/bin/bash

# ──────────────────────────────────────────────
# Android Studio Installer inside Debian via Termux
# Author: Solo FF
# GitHub: https://github.com/YOUR_USERNAME/YOUR_REPO
# Date: August 2025
# ──────────────────────────────────────────────

echo "📦 Updating Termux..."
pkg update -y && pkg upgrade -y
pkg install proot-distro wget curl git -y

echo "🐧 Installing Debian Linux..."
proot-distro install debian

echo "🛠 Preparing setup script inside Debian..."

# Create Debian-side setup script
cat << 'EOF' > ~/debian-setup.sh
#!/bin/bash

echo "🔁 Updating Debian..."
apt update && apt upgrade -y

echo "☕ Installing OpenJDK and GUI packages..."
apt install -y openjdk-17-jdk lxde tightvncserver wget curl git unzip sudo

echo "📦 Installing Android Studio dependencies (i386 libs)..."
dpkg --add-architecture i386
apt update
apt install -y lib32z1 libbz2-1.0:i386 libncurses5:i386 libc6:i386 libstdc++6:i386

echo "⬇️ Downloading Android Studio..."
cd /root
wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2025.1.1.21/android-studio-2025.1.1.21-linux.tar.gz

echo "📂 Extracting Android Studio..."
tar -xzf android-studio-*.tar.gz
mv android-studio /opt/

echo "🧠 Setting up default environment..."
echo 'export DISPLAY=:1' >> ~/.bashrc
echo 'vncserver :1' >> ~/.bashrc

echo "✅ Setup complete!"
echo "🔑 To start Android Studio GUI:"
echo "   1. Run: vncserver :1"
echo "   2. Connect using VNC Viewer to 127.0.0.1:5901"
echo "   3. Run: /opt/android-studio/bin/studio.sh"
EOF

# Give execute permission
chmod +x ~/debian-setup.sh

# Copy into Debian and execute
echo "🚀 Running setup inside Debian..."
proot-distro login debian -- bash /host-rootfs/data/data/com.termux/files/home/debian-setup.sh

echo "🎉 DONE!"
echo "👉 To launch Debian: proot-distro login debian"
echo "👉 Then run: vncserver :1"
echo "👉 Then run: /opt/android-studio/bin/studio.sh"
echo "✅ Use VNC Viewer to connect: 127.0.0.1:5901"

