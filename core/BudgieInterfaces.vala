/*
 * BudgieInterfaces.vala
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
