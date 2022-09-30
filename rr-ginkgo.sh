# Buka Directory
cd ~/rr

rm -rf frameworks/base
rm -rf packages/apps/Settings
rm -rf hardware/qcom-caf/sm8150/display && rm -rf hardware/qcom-caf/sm8150/media && rm -rf hardware/qcom-caf/sm8150/audio

# Sync Repo
repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b Q
repo sync -f --force-sync --no-clone-bundle

# Hals
rm -rf hardware/qcom-caf/sm8150/display && rm -rf hardware/qcom-caf/sm8150/media && rm -rf hardware/qcom-caf/sm8150/audio
git clone https://github.com/DqrKn3Zz/android_hardware_qcom-caf_sm8150_audio -b trinket-q hardware/qcom-caf/sm8150/audio
git clone https://github.com/DqrKn3Zz/android_hardware_qcom-caf_sm8150_media -b trinket-q hardware/qcom-caf/sm8150/media
git clone https://github.com/DqrKn3Zz/android_hardware_qcom-caf_sm8150_display -b trinket-q hardware/qcom-caf/sm8150/display

# Hapus Out
#rm -rf out
rm -rf out/.lock

# Clone Toolclain
rm -rf prebuilts/clang/host/linux-x86/clang-13.0
git clone https://github.com/kdrag0n/proton-clang --depth=1 prebuilts/clang/host/linux-x86/clang-13.0

# DSB & Like Octavi
cd packages/apps/Settings
git fetch https://github.com/zhantech/Resurrection_packages_apps_Settings Q
git cherry-pick 81ac53c65bc99d1023105a3a3e0b082a6d721092^..e1d13d83c4bc45356dd916f59fdea0e845501613
cd ../../..

# DSB
cd frameworks/base
git fetch https://github.com/zhantech/android_frameworks_base Q
git cherry-pick d1e0af17c1d4086ad77ba1843ebcdde8755beaab
cd ../..

# Lawnchair
cd vendor/rr
git fetch https://github.com/zhantech/android_vendor_resurrection Q
git cherry-pick f63673bc24f900368174d52797f4d4d90565d66e
cd ../..

# Use Cache
export USE_CCACHE=1
ccache -M 150G

# Build Rom
. build/envsetup.sh
export KBUILD_BUILD_USER="ZHANtech"; export KBUILD_BUILD_HOST="gatotkaca"
brunch rr_ginkgo-user
