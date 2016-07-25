################################################################################
#
# libfprint
#
################################################################################

GOBRED_VERSION = f89e5b0ce7cf182286d6c5bbd61a6293ccf34218
GOBRED_SITE = $(call github,abihf,gobred,$(GOBRED_VERSION))

GOBRED_LICENSE = LGPLv3
GOBRED_LICENSE_FILES = COPYING
GOBRED_INSTALL_STAGING = YES
GOBRED_DEPENDENCIES = host-pkgconf wpe libfprint pcsc-lite
GOBRED_AUTORECONF = YES

GOBRED_CONF_OPTS = --with-port=wpe


define GOBRED_BINS
	$(INSTALL) -D -m 0755 package/gobred/gobred $(TARGET_DIR)/usr/bin
endef

define GOBRED_AUTOSTART
	$(INSTALL) -D -m 0755 package/gobred/S30gobred $(TARGET_DIR)/etc/init.d
endef

GOBRED_POST_INSTALL_TARGET_HOOKS += GOBRED_BINS
GOBRED_POST_INSTALL_TARGET_HOOKS += GOBRED_AUTOSTART

$(eval $(autotools-package))
