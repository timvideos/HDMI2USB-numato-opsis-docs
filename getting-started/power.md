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
![PCIe 6-Pin Opsis Pin Diagram](/img/power/standard-pcie-6pin-opsis.png)

The Opsis can be powered by PCI Express connector from an ATX power supply.
Sometimes called the "Graphics card connector".

These connectors should have yellow and black wires going into them. Make sure
black wires are on the side <b>with</b> the clip.

<span class="note-warning">
 There are a number of power connectors which look similar to the PCIe 6-Pin
 which are <b>not</b> compatible with the Opsis board and can damage your board!
 <br>
 Do <b>not</b> try to use Opsis board with;
 <ul>
  <li>6 Pin ATX Auxiliary power connector (which has orange and red cables).</li>
  <li>8 Pin EPS connector (which has yellow and black cables).</li>
  <li>4 Pin ATX 12V connector, also called "CPU Power" (which has yellow and black cables).</li>
 </ul>
</span>

![PCIe 6-Pin Cable Pin Diagram](/img/power/standard-pcie-6pin-cable.png)

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

