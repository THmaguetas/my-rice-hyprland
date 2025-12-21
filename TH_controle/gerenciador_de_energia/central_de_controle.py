#!/usr/bin/env python3

import gi
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk, Gdk
import subprocess

css = Gtk.CssProvider()
css.load_from_path("/home/th/.config/Hypr_rice-th/TH_controle/gerenciador_de_energia/style.css")

Gtk.StyleContext.add_provider_for_screen(
    Gdk.Screen.get_default(),
    css,
    Gtk.STYLE_PROVIDER_PRIORITY_USER,
)

class th_energia(Gtk.Window):
    def off(self, widget):
        subprocess.run(['systemctl', 'poweroff'])


    def rbt(self, widget):
        subprocess.run(['systemctl', 'reboot'])


    def lk(self, widget):
        subprocess.run(['hyprlock'])


    def __init__(self):
        super().__init__(title="th control")
        super().__init__(application="th.controle")
        self.set_default_size(30, 20)
        self.connect("destroy", Gtk.main_quit)

        grid = Gtk.Grid()
        grid.set_row_spacing(10)
        grid.set_column_spacing(10)
        self.add(grid)


        # botões e callbacks
        poweroff = Gtk.Button(label="⏻")
        poweroff.connect("clicked", self.off)

        reboot = Gtk.Button(label="⟳")
        reboot.connect("clicked", self.rbt)

        lock = Gtk.Button(label="❙❙")
        lock.connect("clicked", self.lk)

        # arrumamento no grid
        grid.attach(poweroff, 0,0,1,1)
        grid.attach(reboot, 1,0,1,1)
        grid.attach(lock, 0,1,2,1)

        # nome das widgets para o css interpretar
        poweroff.get_style_context().add_class("poweroff")
        reboot.get_style_context().add_class("reboot")
        lock.get_style_context().add_class("lock")

win = th_energia()
win.show_all()
Gtk.main()
