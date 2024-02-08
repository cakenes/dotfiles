Append usbcore.autosuspend=-1 to:	/etc/default/grub
					for disabled usb autosuspend 

Move xorg.conf to:			/etx/X11/
Move mouse/keyboard config files to:	/etc/X11/xorg.conf.d/

Move override.conf to:			/etc/systemd/system/getty@tty1.service.d/
					for autologin on tty1

Install packages from packges/ with:	pacman -S --needed - < pkglist.md
					yay -S --needed - < aurlist.md

Update installed packages to list with: pacman -Qqen > pkglist.md
					pacman -Qqem > aurlist.md
