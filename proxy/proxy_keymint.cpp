#include <aidl/android/hardware/security/keymint/IKeyMintDevice.h>
#include <aidl/android/hardware/security/keymint/BnKeyMintDevice.h>   // <-- добавь
#include <android/binder_manager.h>
#include <android/binder_process.h>
#include <log/log.h>

using ::aidl::android::hardware::security::keymint::IKeyMintDevice;
using ::aidl::android::hardware::security::keymint::BnKeyMintDevice;

struct KeyMintProxy : public BnKeyMintDevice {
    std::shared_ptr<IKeyMintDevice> vendorImpl;

    KeyMintProxy() {
        vendorImpl = IKeyMintDevice::fromBinder(
            ndk::SpAIBinder(AServiceManager_waitForService(
                "android.hardware.security.keymint.IKeyMintDevice/strongbox")));
        if (!vendorImpl) {
            ALOGE("Failed to connect to vendor IKeyMintDevice strongbox");
        }
    }

    ndk::ScopedAStatus getHardwareInfo(
        ::aidl::android::hardware::security::keymint::KeyMintHardwareInfo* out) override {
        if (!vendorImpl) return ndk::ScopedAStatus::fromExceptionCode(EX_NULL_POINTER);
        return vendorImpl->getHardwareInfo(out);
    }

    ndk::ScopedAStatus addRngEntropy(
        const std::vector<uint8_t>& data) override {
        if (!vendorImpl) return ndk::ScopedAStatus::fromExceptionCode(EX_NULL_POINTER);
        return vendorImpl->addRngEntropy(data);
    }

    // TODO: пробросить остальные методы KeyMint
};
