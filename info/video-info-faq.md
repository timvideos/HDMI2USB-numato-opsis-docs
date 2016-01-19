---
layout: page
title: "Video FAQ"
category: info
customToc: true
---


## Summary

Understanding the video capabilities of the Opsis board is quite complicated!
The board has numerous video connectors that are all extremely user
controllable. This FAQ tries to explain both what is theoretically possible,
what is actually possible and what is actively in use on the board. 

There is nothing more frustrating than purchasing something based on the listed
specs only to find out later that there are restrictions. A classic example of
this are devices which list USB2.0 support and then achieve transfer rates
barely in the USB1.1 speed range! For this reason, we have tried to list the
specifications for the Opsis with details about the actual capabilities we have
been using in the real world. However, as the board is built around an FPGA, it
is hard to know how people will end up using the system and we do want people
to try and push it to the limit!

The FAQ also explains some basic background and important points on the [HDMI]
and [DisplayPort] protocols.

If you find any errors or omissions please send a
[pull request](https://github.com/timvideos/HDMI2USB-numato-opsis-docs/pulls)
or open a 
[GitHub issue](https://github.com/timvideos/HDMI2USB-numato-opsis-docs/issues).

We are also open to things which could be clearer or explained better!

### TL;DR

The important summary of the information is that on the Opsis;

 * The [HDMI] connectors support resolutions with equivalent bandwidth of
   `SXGA @ 60Hz` (1280×1024 @ 60Hz progressive) which includes;

    * `XGA@85Hz` (1024×768 @ 85Hz progressive),
    * `1080p30 ` (1920×1080 @ 30Hz progressive),
    * `1080i60 ` (1920×1080 @ 60Hz interlaced),
    * ` 720p60 ` (1280×720 @ 60Hz progressive),
    * but **not** `1080p60` (1920×1080 @ 60Hz progressive).

 * The [DisplayPort] connector supports resolutions up to a bandwidth of
   ~12[Gbit/s] which include extremely high resolutions around 4096 × 2160 @
   24Hz.

 * The [DisplayPort] connector is dual-mode enabled and thus can operate as high
   speed [HDMI] ports using cheap adapters. When operating in [HDMI] modes, many
   high resolutions up to 3840 x 2160 @ 30Hz should work.

## Table of Contents

<div id=toc></div>

<h2 id="bandwidth-to-resolution">How does bandwidth related to resolution?</h2>

In programmable system like an FPGA-based board, the I/O bandwidth supported by
the pins on the device is the major factor that affects the maximum resolution
supported on that connector.

To increase the available bandwidth both protocols use multiple sets of pins,
with [HDMI] always using 3 pairs and [DisplayPort] using between 1 and 4 pairs.
Due to the high bit rates there is also roughly 20% overhead in the wire
encoding protocol meaning that only 80% of the bandwidth is available to
transmit video data.  There is also some other overheads as there are a number
of extra pixels transmitted which don't end up actually displayed on the
screen.

This can make things quite confusing because bandwidth numbers can be quoted as
individual pin or total bandwidth in either raw bandwidth (bit rate) or the
effective bandwidth! It is so easy to get this wrong that I bet that I have
made the mistake at least once in this section. This is why even though the
bandwidth is the important factor we often end up talking in resolutions
instead.

The amount of bandwidth a resolution uses is also dependent on the bits per
pixel and frame rate used with it. You can make a trade off between the bits
per pixel, resolution and frame rate. For example, you can fit 4096×2160 at 24
bits per pixel into ~5[Gbit/s] of bandwidth it you only use 24 frames per second
but need ~12Gbit for 60 frames per second.

It is most common to use 24 bits per pixel (8 bits per RGB channel) and a frame
rate of 50 or 60 frames. When using these combination the following effective
bandwidths give roughly these results;

 * 4[Gbit/s] gives roughly max resolution of 1920×1200.
 * 8[Gbit/s] gives roughly max resolution of 2560×1600. 
 * 12[Gbit/s] gives roughly max resolution of 3840×2160.
 * 14[Gbit/s] gives roughly max resolution of 4096×2160.

There is also a big difference between the maximum bandwidth a standard
supports and the actual bandwidth that a connector supports. For example, a
HDMI2.0 has a maximum bandwidth of ~14[Gbit/s] but very few devices produce
anything close to that.

<h3 id="interlace-vs-progressive">What is interlaced versus progressive?</h3>
<h3 id="interlace-vs-progressive">How is 1080i60 different from 1080p60?</h3>

[Progressive formats](https://en.wikipedia.org/wiki/Progressive_scan)
work how you would imagine, they output the top left pixel,
followed by the one next to it and then so on. 

[Interlaced formats](https://en.wikipedia.org/wiki/Interlaced_video)
are much stranger and are a legacy artifact of how analog TVs use to operate.
With interlace formats every frame is actually only half the image data (even
or odd rows), alternating between the two halves.  The result of transmitting
only half the image data every frame is that you use half the bandwidth. Hence
1080i60 has effectively half the bandwidth of 1080p60.

All films are recorded in progressive formats and computers generated content
is all progressive too. The only things which are interlaced are content
produced directly for TV and even TV now that has mostly moved to progressive.
Interlaced video is extremely hard to work with as to do anything useful with
video you need the whole image data.

**Interlaced video is best avoided all together!**

<h3 id="what-is-4k">What is "4k Video", "UHDTV" or "UHD-1"?</h3>

Most people are happy with their "[high definition]" resolution of 1080p and
720p but bigger numbers are better so manufactures decided to create "ultra
high definition" which is often also called 4K video but nobody could agree on
the exact resolution. There hasn't yet been a good naming of convention in this
area and a lot of difference between consumer and industry terminology. 
[You can read the Wikipedia page](https://en.wikipedia.org/wiki/4K_resolution)
for a lot of information about the different 4K video sizes. To make things
even more complicated, due to massive amount of bandwidth required by the huge
resolution, 4k video is often at much lower frame rates, frequently 24fps or
30fps.

For clarity, in this space, just write out the full resolution in 
`XXXX×XXXXpXX` format.

You can do resolutions which could claim to be "4k" or "Ultra High Definition"
on the [DisplayPort] connectors in the Opsis. However you should read all of
the following items in the FAQ before proceeding! 

 * [video-info-faq:bandwidth-to-resolution]
 * [video-info-faq:dp-on-opsis-resolutions]
 * [video-info-faq:dp-on-opsis-with-dual-mode]
 * [video-info-faq:consider-video-resolutions]

If you are planning on operating at this resolution, please understand that you
will be definitely spend a lot of time making sure your system is highly
optimised to make it work!

<h2 id="what-is-displayport">What is DisplayPort?</h2>

[DisplayPort] is the current standard for video connectivity for the computer
industry. [DisplayPort] is very different from previous video standards and
shares more in common with something like [PCI Express] than other video
standards like [HDMI], [DVI] and VGA.

The [DisplayPort] standard was originally freely available and accessible by
anyone, but that is no longer the case for later versions.

<h3 id="dp-working">How does DisplayPort work?</h3>

Each [DisplayPort] connector has a number of unidirectional lanes (up to 4)
which each provide a given amount of bandwidth plus a slow speed bidirectional
auxiliary channel. The speed that the [DisplayPort] lanes operate at is
independent of bits per pixel, resolution and frame rate, the video data is
instead packetized and multiplexed over the number of lanes required as needed.
The flexible nature of [DisplayPort] packet protocol allows support for many
cool features like multiple monitor support, embedded audio, or variable
refresh rates.

<h3 id="dp-versions">What are the important differences between DisplayPort versions / revisions?</h3>

Due to both the higher bandwidth and flexibility of [DisplayPort], it has
undergone a smaller number of revisions than [HDMI].

Each new [DisplayPort] revision has done two things;

 * Increased the maximum support bandwidth per lane and this the overall
   bandwidth available. Increasing the bandwidth increases the maximum
   supported resolution - see the 
   "[video-info-faq:bandwidth-to-resolution]" section.

   * [DisplayPort 1.0] has two modes;
     - ~1.3[Gbit/s] (RBR) per lane - giving max usable bandwidth of ~4[Gbit/s] with 4 lanes.
     - ~2.2[Gbit/s] (HBR) per lane - giving max usable bandwidth of ~8[Gbit/s] with 4 lanes.

   * [DisplayPort 1.2] has 5.4[Gbit/s] (HBR2) per lane - giving max usable
     bandwidth of ~16[Gbit/s] with 4 lanes.

   * [DisplayPort 1.3] has 8.1[Gbit/s] (HBR3) per lane - giving max usable
     bandwidth of ~25[Gbit/s] with 4 lanes.

 * Added new "protocol features";

   * [DisplayPort 1.2] added multi-monitor support, increased AUX channel
     bandwidth, more color spaces, 3d and the "mini displayport" connector.

   * [DisplayPort 1.3] added mandatory support for Dual-Mode operation compatible
     with HDMI2.0

<h3 id="dp-on-opsis-resolutions">What resolutions are supported by DisplayPort connectors on the Opsis board?</h3>

The high speed transceivers on the Spartan 6, which on the Opsis are connected
to the [DisplayPort] connectors, support both ~1.3[Gbit/s] (RBR) per lane and
~2.2[Gbit/s] (HBR) per lane. The Opsis has all 4 lanes enabled giving an
effective bandwidth of roughly ~8[Gbit/s] with 4 lanes.

This means the board supports "4k" video on these connectors with a number of
caveats. See the [video-info-faq:what-is-4k] section for more information.

<h3 id="dp-on-opsis-versions">What version of DisplayPort is compatible with Opsis board?</h3>

All features of [DisplayPort] should be implementable on the Opsis board.

<h3 id="dp-dual-mode">What is DisplayPort Dual Mode?</h3>

A ["dual mode" connector](https://en.wikipedia.org/wiki/DisplayPort#Dual-mode)
means that you can connect both [DisplayPort] and [HDMI] devices (with a cheap
adapter) to the port.

[DisplayPort] and [HDMI] are totally incompatible protocols, however as people
commonly want to connect their laptops and computers which only have
[DisplayPort] connectors to [HDMI] compatible devices, someone at [DisplayPort]
came up with the idea of a "dual mode" connector. Such a connector is the
[DisplayPort] "shape" but can actually operate in either [DisplayPort] protocol
or the [HDMI] protocol modes.

This means;

 * When you connect a [DisplayPort] cable and device to the connector,
   everything is talking the [DisplayPort] protocol.

 * When you connect a [HDMI] cable and device to the connector by a cheap
   "[DisplayPort] to HDMI adapter" the system switches to talking the [HDMI]
   protocol.

This requires one device to implement both the [DisplayPort] protocol and the
[HDMI] protocol on the same set of pins. As our board is an FPGA this is just a
simple "software" problem.

This is why you'll see [DisplayPort] to [HDMI] adapters for like $5 USD on
Amazon and other places. The adapter is actually a dumb device which only has
to do a very simple logic level shifting! There is some confusing terminology
around these adapters as they are sometimes called "passive adapters" because
they don't actually have any smarts in them.

You can read more about how this is done on 
[Wikipedia](https://en.wikipedia.org/wiki/DisplayPort#Dual-mode)
and in the 
[VESA DisplayPort Interoperability Guideline specification](http://hackipedia.org/Hardware/video/connectors/DisplayPort/VESA%20DisplayPort%20Interoperability%20Guideline%20v1.1.pdf). 

<h3 id="dp-dual-mode-means">Does Dual Mode mean I can connect HDMI devices to the DisplayPort connectors?</h3>

With cheap adapters, yes you can! This is supported.

<h3 id="dp-on-opsis-with-dual-mode">What resolutions are supported by DisplayPort connectors on the Opsis board when used as HDMI ports (via Dual Mode)?</h3>

[HDMI] only has three lanes compared to [DisplayPort]'s four available, however
[HDMI] can operate closer to the full 3[Gbit/s] speed of the transceivers.
This means the raw bit rate when operating in [HDMI] mode is 9[Gbit/s] which
gives the same effective bandwidth as [HDMI 1.3] making resolutions like;
2560×1600p @ 60 Hz or 3840 × 2160 @ 30 Hz possible.

There is a more information about [HDMI] in the following section.

<h2 id="what-is-hdmi">What is HDMI?</h2>

[HDMI] is the current standard for video connectivity of consumer entertainment
electronics.

[HDMI] is based on the older DVI standard. It is both 100% electrically
compatible and backward compatible at the protocol level but uses a different
connector. This electrical and protocol compatibility is why you can get DVI to
[HDMI] adapters for less than a dollar, the adapter simply changes the shape of
the connector!

[HDMI] extends the DVI standard with things important to consumer and
entertainment industry such as;

 * Non-RGB pixel formats such as YCbCr in 4:2:2/4:4:4
 * Embedded audio.
 * CEC - remote control protocol.

<h3 id="hdmi-versions">What is important about the HDMI versions?</h3>

There are multiple revisions of the [HDMI] specification. Each [HDMI] version
has been backward compatible with previous versions, all the way back to the
DVI standard it is based on. 

Each new [HDMI] version has done two things;

 * Increase the maximum supported bandwidth. Increasing the bandwidth increases
   the maximum supported resolution.

   * HDMI 1.0 has max bandwidth of ~4[Gbit/s].
   * HDMI 1.3 has max bandwidth of ~8[Gbit/s].
   * HDMI 2.0 has max bandwidth of ~14[Gbit/s].
 
 * Added new "protocol features".

   * HDMI 1.1 and 1.2 introduced new audio formats and cleaned up CEC a little.
   * HDMI 1.3 introduced more new audio formats and deep color / wide gamut
     pixel formats.
   * HDMI 1.4 introduced 3d support, audio return, Ethernet.
   * HDMI 2.0 introduces even more audio formats and even more color and pixel
     options.

<h3 id="hdmi-on-opsis-resolution">What resolutions are supported by HDMI connectors on the Opsis board?</h3>

Being a FPGA board as long the resolution fits within the bandwidth of the
Spartan-6 IO pins any bits per pixel, resolution and frame rate is supported by
the Opsis board (you could even make up your own). See the 
"[video-info-faq:bandwidth-to-resolution]" and "[video-info-faq:hdmi-versions]"
questions for more.

The IO pins roughly effective bandwidth of ~2.0 [Gbit/s] which means the
following standard resolutions when using 24 bits per pixel work reliably in
decreasing bandwidth required order;

 * 1280×1024 @ 60Hz
 * 1024×768 @ 85Hz
 * 1920×1080 @ 30Hz
 * 1024×768 @ 75Hz
 * 1280×720 @ 60Hz
 * 1024×768 @ 60Hz
 * anything lower....

With 
[various techniques](http://hamsterworks.co.nz/mediawiki/index.php/Spartan_6_1080p)
it is possible to get the IO pins to operate fast enough to provide the ~3
[Gbit/s] needed by 1920×1080 @ 60Hz which works with many displays. However the
output has too much jitter and is not compliant with the [HDMI] standard.

<h3 id="hdmi-on-opsis-versions">What versions of HDMI is compatible with Opsis board?</h3>

Being a FPGA board the Opsis board doesn't fit neatly into the [HDMI] standard
categories. Any feature which doesn't require extra hardware functionality can
be implemented in software. 

This includes anything around;
 * different resolutions (see the 
   "[video-info-faq:hdmi-on-opsis-resolutions]"
   and 
   "[video-info-faq:dp-on-opsis-with-dual-mode]"
   question.)

 * different aspect ratios (16:9, 4:3, 16:10, 21:9)

 * different pixel formats (sRGB, YCbCr 4:2:2/4:4:4/4:2:0)

 * different frame rates (144Hz, 120Hz, 85Hz, 75Hz, 60Hz, 59.94Hz, 50Hz, 48Hz,
   30Hz, 29.97Hz, 24Hz, etc)

 * different modes (like 3D, dual view, etc) 

 * embedded audio formats (any number of channels, formats or bit rates)

The hardware on the board has the right connections to support the following
features;

 * DDC / EDID features
 * CEC features
 * ARC features (ARC is unsupported on the Dual-Mode DisplayPort)

The hardware is unable to implement HEAC functionality (Ethernet over HDMI cable).

<h2 id="consider-video-resolutions">What other things are there to consider when thinking about video resolution?</h2>

Once you have the video going into the FPGA you need to actually do something
with it. The higher the resolution the harder it can be to do something useful
with.

For example,

Even with MJPEG compression used in the HDMI2USB.tv firmware, the USB2.0 port
only really has enough bandwidth for a single 720p30 output, so operating at
higher solution / frame rates doesn't make a huge amount of sense.

Gigabit Ethernet has double the bandwidth of the USB2.0 interface but you might
want to stream both [HDMI] inputs at 720p30 rather than a single 1080p30 output.

The bandwidth DDR memory on the board can be a restrictive factor when all the
inputs and outputs independently at higher resolutions.

<h2 id="hdmi-examples">What examples exist for using HDMI on an FPGA?</h2>

There are numerous examples of implementing [HDMI] on the Spartan 6 FPGA. These
include; 

 * [XAPP495 from Xilinx](http://www.xilinx.com/support/documentation/application_notes/xapp495_S6TMDS_Video_Interface.pdf)
 * [NeTV example from Bunnie](https://github.com/bunnie/netv-fpga)
 * Sample code for the Digilent Atlys and the miniSpartan6+
 * [Excellent examples from Mike Field at HamsterWorks](http://hamsterworks.co.nz/mediawiki/index.php/FPGA_Projects).
 * Both the
   [original HDMI2USB.tv firmware](https://github.com/timvideos/HDMI2USB-jahanzeb-firmware)
   and the
   [new MiSoC based firmware](https://github.com/timvideos/HDMI2USB-misoc-firmware).
 * The [MiSoC library](https://github.com/m-labs/misoc) itself.

We are actively building a
[repository of code samples and demos](https://github.com/timvideos/HDMI2USB-numato-opsis-sample-code)
which demonstrate how to make use of [HDMI] features of the board.

If you are so inclined, there are also numerous commercial cores which can be
purchased and should operate on the Opsis without problems.

<h2 id="dp-examples">What examples exist for using DisplayPort on an FPGA?</h2>

We are working on getting the fully open source version of the [DisplayPort]
connectors working so we can integrated it into the HDMI2USB firmware (we also
have been testing with commercial cores which require a license).

Our friend [Mike Field] is working on doing an
[open source DisplayPort core](https://github.com/hamsternz/FPGA_DisplayPort)
we hope to reuse and he already has a preproduction Opsis board to test with.

<h2 id="hdmi2usb-firmware">What does the [HDMI2USB.tv] firmware utilise?</h2>

The firmware currently restricts the maximum resolution to 720p60.

We have experimentally enabled 1080p30 support which works but currently due to
a number of bugs makes the development cycle too slow (compiling the firmware
goes from taking 15 minutes to taking over 2 hours). We have logged issues
about the needed optimises to the firmware and hope to have this functionality
permanently enabled shortly.

The firmware does not currently support the [DisplayPort] connectors. This
feature is
[currently actively being worked](https://github.com/timvideos/HDMI2USB-misoc-firmware/milestones/Enable%20Numato%20Opsis%20DisplayPort) 
on by Florent from [Enjoy Digital].

The firmware only implements enough of the [HDMI] protocol for user group and
conference recording. It does not currently support features like CEC or Audio
support. We have plans to implement the following features but they are not
ready yet (as they were not possible on our existing prototyping boards);

 * HDMI1.1 and HDMI1.2 embedded audio formats
 * HDMI1.2 CEC support via http://libcec.pulse-eight.com/
 * HDMI1.3 Deep color support
 * HDMI1.4 ARC support
 * and much more!

