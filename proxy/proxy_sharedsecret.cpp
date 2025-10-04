#include <aidl/android/hardware/security/sharedsecret/ISharedSecret.h>
#include <aidl/android/hardware/security/sharedsecret/BnSharedSecret.h>
#include <android/binder_manager.h>
#include <android/binder_process.h>
#include <log/log.h>

using ::aidl::android::hardware::security::sharedsecret::ISharedSecret;
using ::aidl::android::hardware::security::sharedsecret::BnSharedSecret;

struct SharedSecretProxy : public BnSharedSecret {
    std::shared_ptr<ISharedSecret> vendorImpl;

    SharedSecretProxy() {
        vendorImpl = ISharedSecret::fromBinder(
            ndk::SpAIBinder(AServiceManager_waitForService(
                "android.hardware.security.sharedsecret.ISharedSecret/strongbox")));
        if (!vendorImpl) {
            ALOGE("Failed to connect to vendor ISharedSecret strongbox");
        }
    }

    ndk::ScopedAStatus getSharedSecretParameters(
        std::vector<uint8_t>* out) override {
        if (!vendorImpl) return ndk::ScopedAStatus::fromExceptionCode(EX_NULL_POINTER);
        return vendorImpl->getSharedSecretParameters(out);
    }

    ndk::ScopedAStatus computeSharedSecret(
        const std::vector<std::vector<uint8_t>>& params,
        std::vector<uint8_t>* out) override {
        if (!vendorImpl) return ndk::ScopedAStatus::fromExceptionCode(EX_NULL_POINTER);
        return vendorImpl->computeSharedSecret(params, out);
    }
};

