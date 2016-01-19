---
layout: page
title: "Info EEPROM"
category: features
---

[Google Docs Version](https://docs.google.com/document/d/14ygLbeHLRzve7zQGckZd9PGwuAYAPxIO91IWQC_lq8I/edit#)

# Opsis EEPROM IC

The Opsis board has a [Microchip 24AA02E48 2048 kbit]() EEPROM connected to both the FX2 and the FPGA.

The Microchip EEPROM has the following;
 * 2K bits == 2048 bits == 256 bytes
 * 0x00 - 0x80 [0->128) == User space
 * 0x80 - 0xFF [128->255] == Write-Protected Node Address Block

# Opsis EEPROM Layout

| Hex Address	| Decimal Addr	| Size (bytes) | Description |
| 0x00 - 0x07	| 0 -> 7	| 8 bytes	| FX2 Configuration | 
| 0x08		| 8		| 1 byte	| Separator null byte |
| 0x09 - 0x7E	| 9 -> 126	| 118 bytes	| OPSIS Board Information. Format a modified version of the TOFE EEPROM format |
| 0x7F		| 127		| 1 byte	| EEPROM Content Checksum |
| 0x80 - 0xF7	| 128 -> 247	| 120 bytes	| Write protected empty |
| 0xF8 - 0xFF	| 248 -> 255	| 8 bytes	| Unique Identifier (MAC Address) |
	

# Opsis EEPROM Content

## FX2 Configuration
| Hex Address | Value | Description                        |
| 0x00        | 0xC0  | FX2 'C0 Load' Format specifier     |
| 0x01        | 0x19  | FX2 Vendor ID (Lower bits)  0x2A19 |
| 0x02        | 0x2A  | FX2 Vendor ID (Higher bits)        |
| 0x03        | 0x40  | FX2 Product ID (Lower bits) 0x5440 |
| 0x04        | 0x54  | FX2 Product ID (Higher bits)       |
| 0x05        | See Docs | FX2 Device ID (Lower bits)      |
| 0x06        | See Docs | FX2 Device ID (Higher bits)     |
| 0x07        | 0x00 | FX2 Configuration Byte, Bit 7 - 0 == Enter high speed mode, Bit 6 - 0 == Come up connected, Bit 0 - 0 == 100 kHz I2C Mode |
| 0x08        | 0x00 | NULL Termination Byte               |

## Opsis Board Information

| Hex Address |	Decimal Address   | Value | Description                                                         |
| 0x09 - 0x0D | 9 -> 13 (6 bytes) | OPSIS - 0x4f, 0x50, 0x53, 0x49, 0x53 | OPSIS Config format identifier       |
| 0x0E        | 14                | 0x01  | TOFE Config format version, 8 bit, Little Endian                    |
| 0x0F        | 15                |       | Number of atoms in EEPROM                                           |
| 0x10        | 16                |       | CRC-8 of complete data (including header), skipping the crc8 field. | 
|             | (4 bytes)         |       | Size of the data section which follows (including footer)           |
| XXX         | X bytes           |       | TOFE Compatible Atoms                                               |
| XXX         | (5 bytes)         | SISPO - 0x53, 0x49, 0x53, 0x50, 0x4f |                                      |
| XXX - 0x7E  | XXXX              | 0x00, ..., 0x00 | Padding for remaining area                                |
| 0x7F        | 127 (1 byte)      |       | CRC8 checksum of EEPROM contents from, 0x00 -> 0x7E and 0x80 -> 0xFF (IE Entire EEPROM contents excluding checksum itself) |

## Microchip EEPROM Read Only Section

| Hex Address |	Decimal Address | Value | Description           |
| 0x80 - 0xF7 | 128 -> 247      | 0xFF  | Write protected empty |
| 0xF8 - 0xFF | 248 -> 255      |       | Unique Identifier     |
