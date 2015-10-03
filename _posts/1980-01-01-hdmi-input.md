---
layout: page
title: "HDMI Input"
category: features
---

The board includes two HDMI inputs.

```
+--------------------+        +----------------+
|                    |        |                |
|    Computer        |>>>>>>>>|  Opsis Board   |
|                    |        |                |
+--------------------+        +----------------+
```

# HDMI - connector J4 - Direction RX
```
NET "j4_TMDS(2)"           LOC =    "K20"       |IOSTANDARD =         TMDS_33;     #                  Red (/HDMI/TMDS-RX1-2_P)
NET "j4_TMDSB(2)"          LOC =    "L19"       |IOSTANDARD =         TMDS_33;     #                      (/HDMI/TMDS-RX1-2_N)
NET "j4_TMDS(1)"           LOC =    "H21"       |IOSTANDARD =         TMDS_33;     #                Green (/HDMI/TMDS-RX1-1_P)
NET "j4_TMDSB(1)"          LOC =    "H22"       |IOSTANDARD =         TMDS_33;     #                      (/HDMI/TMDS-RX1-1_N)
NET "j4_TMDS(0)"           LOC =    "J20"       |IOSTANDARD =         TMDS_33;     #                 Blue (/HDMI/TMDS-RX1-0_P)
NET "j4_TMDSB(0)"          LOC =    "J22"       |IOSTANDARD =         TMDS_33;     #                      (/HDMI/TMDS-RX1-0_N)
NET "j4_TMDS(3)"           LOC =    "M20"       |IOSTANDARD =         TMDS_33;     #                  CLK (/HDMI/TMDS-RX1-CLK_P)
NET "j4_TMDSB(3)"          LOC =    "M19"       |IOSTANDARD =         TMDS_33;     #                      (/HDMI/TMDS-RX1-CLK_N)
# \/ Weakly pulled (100k) to VCC3V3 via R132
# \/ Weakly pulled (27k) to VCC3V3 via R146
NET "hdmi_j4_cec"          LOC =    "K17"       |IOSTANDARD =        LVCMOS33;     #                      (/HDMI/P1-CEC | /HDMI/TMDS-RX1-CEC)
# \/ Weakly pulled (47k) to VCC3V3 via R135
# \/ Strongly pulled (1k) to /HDMI/HDMI_VCC5V0 via R142
NET "hdmi_j4_scl"          LOC =    "L17"       |IOSTANDARD =        LVCMOS33;     #                      (/HDMI/P1-SCL | /HDMI/TMDS-RX1-SCL)
# \/ Weakly pulled (47k) to VCC3V3 via R136
# \/ Strongly pulled (1k) to /HDMI/HDMI_VCC5V0 via R141
NET "hdmi_j4_sda"          LOC =    "T18"       |IOSTANDARD =        LVCMOS33;     #                      (/HDMI/P1-SDA | /HDMI/TMDS-RX1-SDA)
# \/ Strongly pulled (1k) to /HDMI/HDMI_VCC5V0 via R153
# \/ Weakly pulled (15k) to GND via R151
NET "hdmi_j4_hpd"          LOC =    "V19"       |IOSTANDARD =        LVCMOS33;     #                      (/HDMI/P1-HOT | /HDMI/TMDS-RX1-HOT)
```

# HDMI - connector J5 - Direction RX
```
NET "j5_TMDS(2)"           LOC =    "P21"       |IOSTANDARD =         TMDS_33;     #                  Red (/HDMI/TMDS-RX2-2_P)
NET "j5_TMDSB(2)"          LOC =    "P22"       |IOSTANDARD =         TMDS_33;     #                      (/HDMI/TMDS-RX2-2_N)
NET "j5_TMDS(1)"           LOC =    "N20"       |IOSTANDARD =         TMDS_33;     #                Green (/HDMI/TMDS-RX2-1_P)
NET "j5_TMDSB(1)"          LOC =    "N22"       |IOSTANDARD =         TMDS_33;     #                      (/HDMI/TMDS-RX2-1_N)
NET "j5_TMDS(0)"           LOC =    "M21"       |IOSTANDARD =         TMDS_33;     #                 Blue (/HDMI/TMDS-RX2-0_P)
NET "j5_TMDSB(0)"          LOC =    "M22"       |IOSTANDARD =         TMDS_33;     #                      (/HDMI/TMDS-RX2-0_N)
NET "j5_TMDS(3)"           LOC =    "L20"       |IOSTANDARD =         TMDS_33;     #                  CLK (/HDMI/TMDS-RX2-CLK_P)
NET "j5_TMDSB(3)"          LOC =    "L22"       |IOSTANDARD =         TMDS_33;     #                      (/HDMI/TMDS-RX2-CLK_N)
# \/ Weakly pulled (100k) to VCC3V3 via R192
# \/ Weakly pulled (27k) to VCC3V3 via R199
NET "hdmi_j5_cec"          LOC =    "T22"       |IOSTANDARD =        LVCMOS33;     #                      (/HDMI/P3-CEC | /HDMI/TMDS-RX2-CEC)
# \/ Weakly pulled (47k) to VCC3V3 via R193
# \/ Strongly pulled (1k) to /HDMI/HDMI_VCC5V0 via R197
NET "hdmi_j5_scl"          LOC =    "T21"       |IOSTANDARD =        LVCMOS33;     #                      (/HDMI/P3-SCL | /HDMI/TMDS-RX2-SCL)
# \/ Strongly pulled (1k) to /HDMI/HDMI_VCC5V0 via R196
# \/ Weakly pulled (47k) to VCC3V3 via R194
NET "hdmi_j5_sda"          LOC =    "R22"       |IOSTANDARD =        LVCMOS33;     #                      (/HDMI/P3-SDA | /HDMI/TMDS-RX2-SDA)
# \/ Weakly pulled (15k) to GND via R204
# \/ Strongly pulled (1k) to /HDMI/HDMI_VCC5V0 via R205
NET "hdmi_j5_hpd"          LOC =    "R20"       |IOSTANDARD =        LVCMOS33;     #                      (/HDMI/P3-HOT | /HDMI/TMDS-RX2-HOT)
```

## EDID

For a computer to detect the board an EDID ROM needs to be emulated on the I2C channel.

## HPD

For the computer to detect the board the hot plug pin must be set to XXXX.
Toggling the pin will cause the connected computer to think the cable has been
unplugged and then replugged.


