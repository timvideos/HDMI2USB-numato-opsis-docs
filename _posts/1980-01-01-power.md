---
layout: page
title: "Power Supply"
category: getting-started
---

The primary power supply for the Opsis board is 12V DC. 

The board can draw up to 2 Amp under extreme conditions but will normally draw
significantly less.

TOFE expansion boards are also directly connected to this 12V supply which can
increase the current requirements.

## Summary

 * Minimum: 12V DC @ 2A (24 Watts)

<hr>

## Connectors

There are two power supply connectors on the Opsis board. 

![Power Supply Diagram](/img/power/connectors.jpg)

<span class="note-warning">
Only *one* power supply connector should be used at once.
</span>

<br>
<br>
<br>

### Barrel Connector

![Polarity](/img/power/polarity.png)

| Specs          |       |
| --------------:| ----- |
|       Labelled | Con2  |
| Inner Diameter | 2.0mm |
| Outer Diameter | 5.5mm |
|      Inner Pin | +12V  |
|   Outer Shield | GND   |

<br>

![Barrel Connector](/img/power/barrel.jpg)

<hr>
<br>
<br>
<br>

### PCIe 6-Pin Connector

| Specs          |        |
| --------------:| ------ |
|       Labelled | C12V-2 |

<br>

![PCIe 6-Pin Connector](/img/power/pcie-6pin.jpg)

<span class="note-warning">
There are a number of power connectors which look similar to the PCIe 6-Pin
which are *not* compatible with the Opsis board.
</span>

![PCIe 6-Pin Standard](/img/power/standard-pcie-6pin.png)

![PCIe 6-Pin Plug](/img/power/pcie-6pin-plug.jpg)

<hr>
<br>
<br>
<br>

## Extra Details

The 12V supply is not used directly by the board, instead converted to the
various voltages needed by the ICs.

There are numerous power converters on the board. These are highlighted in the
following diagram;

 * The output of each supply is highlighted by the yellow area.

![Power Converters](/img/power/convert.jpg)


<iframe src="https://docs.google.com/spreadsheets/d/1kLR7yQlwvc1OU9FH1j3vCp9KJMV8PBOriW9cUIGDIvM/pubhtml?widget=true&amp;headers=false"></iframe>

