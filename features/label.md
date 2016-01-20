---
layout: page
title: "Label"
category: features
---

The label attached to the Numato Opsis label contains important details about
your device.

The details on the label found on the box *should* match the details of the
label attached to other packaging and the board itself.

Spare labels where included in the Opsis packaging for when the board is
mounted inside a [Case].

<span class="note-preproduction">
The preproduction boards shipped without this label information. If you with to
add it to your board, they can be generated using [HDMI2USB-mode-switch tool].
</span>

## Layout

The Opsis label comes in a couple of different variants to allow it to fit in
different size areas.

### Large Label

![Opsis Label Example](/img/label/large.jpg)

## Board Details

![Opsis Label Product section](/img/label/large-product.jpg)

The barcode is a [Code 128](https://en.wikipedia.org/wiki/Code_128) which
encodes the Opsis website and serves as a "product identification code".

The short sequence of numbers is a 
[short git hash](https://git-scm.com/book/en/v2/Git-Tools-Revision-Selection#Short-SHA-1)
which refers to the revision in the 
[Numato Opsis hardware repository][hardware-repo] that the PCB was generated
from.

This information is also embedded in the [EEPROM] too.

## Device DNA

![Opsis Label DNA section](/img/label/large-dna.jpg)

From *Spartan-6 FPGA Configuration User Guide UG380 (v2.7) October 29, 2014*
<blockquote>
Spartan-6 FPGAs contain an embedded, unique device identifier (device DNA). The
identifier is nonvolatile, permanently programmed into the FPGA, and is unchangeable,
making it tamper resistant.

As shown in Figure 5-14, the device DNA value is 57 bits long. The two most-significant
bits are always 1 and 0. The remaining 55 bits are unique to a specific Spartan-6 FPGA.

The FPGA's internal device identifier, plus any values shifted in on the DIN input, can be
read via the JTAG port using the private ISC_DNA command. This requires the
ISC_ENABLE to be loaded before the ISC_DNA command is issued.

Bit 56 of the identifier, shown in Figure 5-14, appears on the TDO JTAG output following
the ISC_DNA command when the device enters the Shift-DR state. The remaining Device
DNA bits and any data on the input to the register are shifted out sequentially while the
JTAG controller is left in the Shift-DR state. When this operation is complete, the
ISC_DISABLE command should be issued.
</blockquote>

## MAC Address

Each Opsis board contains an EEPROM which is read only, a globally unique,
Ethernet MAC address.

This MAC address is printed on the label and encoded in the QR Code

![Opsis Label MAC section](/img/label/large-mac.jpg)


## Reading QR Codes

Both the [Device DNA](#device-dna) and the [MAC Address](#mac-address) are
encoded on the label using a [QR Code].

[QR Code]s are readable by a wide range of devices, including mobile phones.



 [QR Code]: https://en.wikipedia.org/wiki/QR_code
