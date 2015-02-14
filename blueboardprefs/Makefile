include theos/makefiles/common.mk

BUNDLE_NAME = BlueBoardPrefs
BlueBoardPrefs_FILES = BlueBoardPrefs.mm
BlueBoardPrefs_INSTALL_PATH = /Library/PreferenceBundles
BlueBoardPrefs_FRAMEWORKS = UIKit
BlueBoardPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/BlueBoardPrefs.plist$(ECHO_END)
