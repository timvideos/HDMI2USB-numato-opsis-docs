#!/usr/bin/env python
# -*- coding: <utf-8> -*-

from gimpfu import *
import os, re

gettext.install("gimp20-python", gimp.locale_directory, unicode=True)

def save(image, filename):
	to_save = image.duplicate()
	to_save.merge_visible_layers(0)
	to_save.flatten()
	pdb.file_jpeg_save(to_save, to_save.active_layer, filename, filename, 0.8, 0, 1, 1, "", 0, 1, 0, 0)


def export_master():
	try:
		image = pdb.gimp_file_load("master.xcf", "master.xcf")
		tmp = image.duplicate()
		for layer in tmp.layers[:-1]:
			layer.opacity = 50.0
			layer.visible = False

			args = layer.name.split(", ")
			print(args)
			if len(args) > 1 and args[1].strip() == "Skip":
				continue

			layer.visible = True

		save(tmp, "master.jpg")

		for layer in tmp.layers[:-1]:
			layer.visible = False

		for layer in tmp.layers[:-1]:
			args = layer.name.split(", ")
			filename = "%s.jpg" % args[0]
			if len(args) > 1 and args[1].strip() == "Master":
				continue

			layer.visible = True
			for olayer in tmp.layers[:-1]:
				if layer.name in olayer.name:
					olayer.visible = True
			save(tmp, filename)
			for layer in tmp.layers[:-1]:
				layer.visible = False
	finally:
		pdb.gimp_quit(0)

register(
	proc_name=("python-fu-export"),
	blurb=("Export Layers as PNG"),
	help=("Export layers as individual PNG files."),
	author=("mithro@mithis.com"),
	copyright=("Tim 'mithro' Ansell"),
	date=("2016"),
	label=("Export Parts"),
	imagetypes=("*"),
	params=[],
	results=[],
	function=(export_master), 
	menu=("<Image>/File/E_xport"), 
	domain=("gimp20-python", gimp.locale_directory)
	)

main()
