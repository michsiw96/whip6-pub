#
# whip6: Warsaw High-performance IPv6.
#
# Copyright (c) 2012-2017 Szymon Acedanski
# All rights reserved.
#
# This file is distributed under the terms in the attached LICENSE     
# files.
#
external objects:
  - $(SPEC_DIR)/scif_pwrtest.o

run make at:
  - $(SPEC_DIR)

dependencies:
  - platforms/parts/mcu/cc26xx/native/scif
