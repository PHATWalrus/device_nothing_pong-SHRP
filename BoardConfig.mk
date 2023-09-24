#
# Copyright 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

# Inherit from common
-include $(COMMON_PATH)/BoardConfigCommon.mk

# Recovery
TARGET_OTA_ASSERT_DEVICE := pong

# TWRP specific build flags
TW_FRAMERATE := 120

################### ############################################
# MANDATORY FLAGS # These flags HAVE TO be set/changed by you! #
################### ############################################

# Device codename
# Default (if not set): N/A
SHRP_DEVICE_CODE := pong

# Path of your SHRP device tree
# Replace <device-brand> with the device brand name
# (SHRP_DEVICE_CODE will expand to the above variable so check if that is correct)
SHRP_PATH := device/nothing/$(SHRP_DEVICE_CODE)

# Maintainer name
# Default (if not set): N/A
SHRP_MAINTAINER := PhatWalrus

# Recovery Type (for "About" section only)
# Default (if not set): N/A
SHRP_REC_TYPE := Normal

# Device Type (for "About" section only)
# Default (if not set): N/A
SHRP_DEVICE_TYPE := A/B

# Your device's recovery path, dont use blindly
# Default (if not set): N/A
SHRP_REC := /dev/block/bootdevice/by-name/recovery

# Use this flag only if SHRP_REC is set
# Default (if not set): N/A
SHRP_HAS_RECOVERY_PARTITION := true

# Use this flag only if your device is A/B or Virtual A/B.
# Default (if not set): N/A
SHRP_AB := true

################### ################################################################################
# IMPORTANT FLAGS # These are usually good to check - at least if the defaults are what you expect #
################### ################################################################################

# Emergency DownLoad mode (0 = no EDL mode, 1 = EDL mode available)
# Default (if not set): 0
SHRP_EDL_MODE := 1

# Internal storage path
# Default (if not set): /sdcard
SHRP_INTERNAL := /sdcard

# External SDcard path
# Default (if not set): /
SHRP_EXTERNAL := /external_sd

# USB OTG path
# Default (if not set): /
SHRP_OTG := /usb_otg

# Flashlight: (0 = disable, 1 = enable)
# Default (if not set): 0
SHRP_FLASH := 1

# Vibrator
TW_SUPPORT_INPUT_AIDL_HAPTICS := true
#TW_SUPPORT_INPUT_AIDL_HAPTICS_FIX_OFF := true

TARGET_RECOVERY_DEVICE_MODULES += libexpat
RECOVERY_LIBRARY_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libexpat.so
