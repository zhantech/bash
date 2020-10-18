# Buka Directory
cd ~/komodo

# Sync Repo
repo init -u https://github.com/Komodo-OS-Rom/manifest -b ten
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

# Hapus Out
rm -rf out
rm -rf out/.lock

# Hapus Tree
rm -rf device/xiaomi/santoni
rm -rf kernel/xiaomi/msm8937
rm -rf vendor/xiaomi

# Hapus Toolclain
rm -rf prebuilts/clang/host/linux-x86/clang-12

# Clone Tree
git clone https://github.com/Komodo-OS-Devices/device_xiaomi_santoni.git -b ten device/xiaomi/santoni
git clone https://github.com/zhantech/android_kernel_xiaomi_santoni.git -b luuvy-4.9 kernel/xiaomi/msm8937
git clone https://github.com/Komodo-OS-Devices/vendor_xiaomi_santoni.git -b ten vendor/xiaomi/

# Clone Toolclain
git clone https://github.com/kdrag0n/proton-clang --depth=1 prebuilts/clang/host/linux-x86/clang-12

# Faceunlock
rm -rf external/motorola/faceunlock
git clone https://github.com/Komodo-OS-Devices/external_fu.git -b ten external/motorola/faceunlock
. external/motorola/faceunlock/regenerate/regenerate.sh

# Use Cache
export USE_CCACHE=1
ccache -M 150G

# Build Rom
. build/envsetup.sh
lunch komodo_santoni-userdebug
export KBUILD_BUILD_USER="ZHANtech™"; export KBUILD_BUILD_HOST="batikholic"
masak komodo -j30
