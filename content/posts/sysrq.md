+++
## title = "SysRQ"
title = "Save your System with sysrq"
description = ""
date = 2023-01-10
updated = 2025-01-01
draft = false

[taxonomies]
categories = ["Website"]
tags = ["linux", "tool", "tutorial" ]

[extra]
lang = "en"
toc = true
comment = false
copy = true
outdate_alert = true
outdate_alert_days = 120
math = false
mermaid = false
featured = false
reaction = false
+++

<!-- # Save your System with SysRQ -->

## [1] What the heck is SysRQ?:

SysRQ is a key on your keyboard. If you don't see it, chances are your PrtSc key doubles as it. The insert key and PrtSc/SysRQ key are usually right next to each other, near where your numpad would be.

## [2] What does SysRQ do exactly, and how can it save my system?:

SysRQ is the magic key (that is even what it is called in the Linux kernel). You can use it to send messages directly to the kernel.
Here are some situations where you might want to do that:

1. Your system freezes, and your only option (not knowing about SysRQ ofc) is to hard turn off the machine.
   (I cannot think of any others at the moment, this is kind of what you would use SysRQ primarily for!)

The reason you would not want to hard power off the machine is because that surprises the OS. If the OS is in the middle of writing to disk for example, it could corrupt the filesystem (which is not good at all)! SysRQ comes in handy, because it talks directly to the Linux kernel. So, even if everything on your system is locked up, you can still communicate directly to the Linux kernel, with SysRQ. SysRQ allows you to reboot your computer correctly.

## [3] Great! So... how do I use it?:

In order to use it, we must make sure the system is configured to use it.
You can make sure by reading the output of this command: cat /proc/sys/kernel/sysrq

If the output is:

1: Enabled, and you can skip to section 5.
Not 1: Not enabled, and you have some work to do.

## [4] Alright, how do I enable SysRQ?:

You can enable SysRQ with a simple command... sort of, see, you can enable it with this command as root: echo 1 > /proc/sys/kernel/sysrq
But the issue is that this does not persist after a reboot! If you want to have your changes stay even after rebooting, you will have to run this at startup.

Depending on the distro, there are different ways to do this:

Generic Distros: You can enable SysRQ even after reboot with this simple command as root: echo "kernel.sysrq = 1" >> /etc/sysctl.d/99-sysctl.conf
NixOS: You can do this on NixOS by adding one line to configuration.nix in the global scope: boot.kernel.sysctl."kernel.sysrq" = 1;

## [5] Okay... now, how to use SysRQ?:

I mentioned earlier that all most people are gonna use SysRQ for is rebooting their machine properly if it freezes. If you want to do this, you have to remember 6 letters: REISUB
A good way to remember these is to remember: (R)eboot (E)ven (I)f (S)ystem (U)tterly (B)roken

If you want to actually do this, what you need to do is hold down the ALT key, and the SysRQ key down at the same time. Once you are holding them down, you want to press the first or next queued letter. And, you need to release the ALT and SysRQ keys after every letter (command) pressed. So, you would end up holding down ALT + SysRQ 6 times during the REISUB sequence. I repeat, you can not enter multiple letters without releasing your fingers from ALT + SysRQ, then putting them back down!

What REISUB is doing:

R: Turns off keyboard raw mode, and sets it to XLATE.
E: Send a SIGTERM to all processes, except for init.
I: Send a SIGKILL to all processes, except for init.
S: Will attempt to sync all mounted filesystems.
U: Will attempt to re-mount all mounted filesystems as read-only.
B: Reboot!

## [6] Did you find this out yourself?:

No, I watched a Chris Titus Tech video about it. Here is the link:

{{ youtube(id="ZiX327d8Ys0") }}
