/*
 * BrightnessIndicator.vala
 * 
 * Copyright 2014 Ikey Doherty <ikey.doherty@gmail.com>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 */

[DBus (name = "org.gnome.SettingsDaemon.Power.Screen")]
public interface BrightnessInterface : Object
{
    public abstract int Brightness { public owned get ;  public set ; }
}

public class BrightnessIndicator
{
    /** For the Status popover */
    public Gtk.Scale status_widget { protected set ; public get ; }
    public Gtk.Image status_image { protected set; public get; }

    BrightnessInterface brightness;
    public bool usable = true;

    public BrightnessIndicator()
    {
        status_widget = new Gtk.Scale.with_range(Gtk.Orientation.HORIZONTAL, 0, 100, 10);
        status_widget.set_draw_value(false);

        status_image = new Gtk.Image.from_icon_name("display-brightness-symbolic", Gtk.IconSize.INVALID);
        status_image.pixel_size = icon_size;

        try {
            brightness = Bus.get_proxy_sync(BusType.SESSION, "org.gnome.SettingsDaemon.Power", "/org/gnome/SettingsDaemon/Power");
            if (brightness.Brightness < 0) {
                usable = false;
            }

            stdout.printf("Cur brightness: %d\n", brightness.Brightness);
        } catch (Error e) {
            message(e.message);
        }
    }
} // End class
