# Buka Directory
cd ~/nad-11
rm -rf .repo/local_manifests

# Fix Hals
rm -rf hardware/qcom-caf/msm8996/audio
rm -rf hardware/qcom-caf/msm8996/display
rm -rf hardware/qcom-caf/msm8996/media
rm -rf vendor/qcom/opensource/display-commonsys-intf
rm -rf hardware/qcom-caf/wlan

# Custom
rm -rf device/qcom/sepolicy-legacy-um
rm -rf system/bt

# Sync Repo
repo init -u ssh://git@github.com/Nusantara-ROM/android.git -b 11
repo sync --force-sync --no-tags --no-clone-bundle

# Hapus Out
rm -rf out
rm -rf out/.lock

# Hapus Tree
rm -rf device/xiaomi/santoni
rm -rf kernel/xiaomi/msm8937
rm -rf vendor/xiaomi

# Hapus Qcom Power
rm -rf vendor/qcom/opensource/power

# Hapus Toolclain
rm -rf prebuilts/clang/host/linux-x86/clang-r399163b

# Clone Tree
git clone https://github.com/zhantech/android_device_xiaomi_santoni.git -b nad-11 device/xiaomi/santoni
git clone https://github.com/zeta96/L_check_msm-4.9.git -b wip kernel/xiaomi/msm8937
git clone https://github.com/zhantech/vendor_xiaomi_santoni.git -b nad-11 vendor/xiaomi/

# Clone Toolclain
git clone https://github.com/crdroidandroid/android_prebuilts_clang_host_linux-x86_clang-6875598 --depth=1 prebuilts/clang/host/linux-x86/clang-r399163b

# Use Cache
export USE_CCACHE=1
ccache -M 150G

# Fix Hals
rm -rf hardware/qcom-caf/msm8996/audio
rm -rf hardware/qcom-caf/msm8996/display
rm -rf hardware/qcom-caf/msm8996/media
rm -rf vendor/qcom/opensource/display-commonsys-intf
rm -rf hardware/qcom-caf/wlan
git clone https://github.com/Jabiyeff/android_hardware_qcom_audio -b lineage-18.0-caf-msm8996 hardware/qcom-caf/msm8996/audio
git clone https://github.com/Jabiyeff/android_hardware_qcom_display -b caf-msm8996-r hardware/qcom-caf/msm8996/display
git clone https://github.com/Jabiyeff/android_hardware_qcom_media -b caf-msm8996-r hardware/qcom-caf/msm8996/media
git clone https://github.com/Jabiyeff/android_hardware_qcom_display -b R-commonsys-intf vendor/qcom/opensource/display-commonsys-intf
git clone https://github.com/Jabiyeff/android_hardware_qcom-caf_wlan -b LA.UM.9.6.2.r1 hardware/qcom-caf/wlan

# Custom
rm -rf device/qcom/sepolicy-legacy-um
rm -rf system/bt
git clone https://github.com/Jabiyeff/android_device_qcom_sepolicy -b lineage-18.0-legacy-um device/qcom/sepolicy-legacy-um
git clone https://github.com/Jabiyeff/android_system_bt -b lineage-18.0 system/bt

# Build Rom
. build/envsetup.sh
lunch nad_santoni-userdebug
export KBUILD_BUILD_USER="ZHANtech™"; export KBUILD_BUILD_HOST="batikholic"
mka nad -j30
