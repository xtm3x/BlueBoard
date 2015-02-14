GO_EASY_ON_ME = 1
export ARCHS = armv7 armv7s arm64
export TARGET = iphone:clang::7.1

include theos/makefiles/common.mk

TWEAK_NAME = BlueBoard
BlueBoard_FILES = Tweak.xm
BlueBoard_FRAMEWORKS = UIKit CoreGraphics QuartzCore
ARCHS = armv7 arm64

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += blueboardprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
