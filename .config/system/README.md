### Append usbcore.autosuspend=-1 to:
`/etc/default/grub`
### Move xorg.conf to:
`/etx/X11/`
### Move 00-keyboard, 10-monitor, 50-mouse to:
`/etc/X11/xorg.conf.d/`
### Autologin on tty1 -> move override.conf to:
`/etc/systemd/system/getty@tty1.service.d/`
### Update installed packages to list with:
`pacman -Qqen > pkglist.md`<br/>
`pacman -Qqem > aurlist.md`
### Install packages from packges/ with
`pacman -S --needed - < pkglist.md`<br/>
`yay -S --needed - < aurlist.md`
