# Buka Directory
cd ~/rr

# Sync Repo
repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b Q
repo sync -f --force-sync --no-clone-bundle

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
git clone https://github.com/zhantech/android_device_xiaomi_santoni.git -b rr-10 device/xiaomi/santoni
git clone https://github.com/zhantech/android_kernel_xiaomi_santoni.git -b luuvy-4.9 kernel/xiaomi/msm8937
git clone https://github.com/zhantech/vendor_xiaomi_santoni.git -b rr-10 vendor/xiaomi/

# Clone Toolclain
git clone https://github.com/kdrag0n/proton-clang --depth=1 prebuilts/clang/host/linux-x86/clang-12

# Lawnchair
cd vendor/rr
git fetch https://github.com/zhantech/android_vendor_resurrection Q
git cherry-pick a628ad8e3bcfeb6728234a6e7cc1661802cc6204
git cherry-pick 87d035d04e2556472ced65a066afa16945da3301
cd ../..

# Use Cache
export USE_CCACHE=1
ccache -M 150G

# Build Rom
. build/envsetup.sh
export KBUILD_BUILD_USER="ZHANtech™"; export KBUILD_BUILD_HOST="batikholic"
brunch rr_santoni-user
