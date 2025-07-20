---
title: GTK Single Instance Mode
description: |-
  GTK single instance mode is a feature that ensures only one instance of the
  application is running at a time.
---

Ghostty uses GTK single instance mode by default when it detects
it is launched from a desktop environment (i.e. not from the CLI).

GTK single instance mode is recommended by the GTK project and is
the idiomatic way official Gnome applications are expected to behave.
When a second instance of Ghostty is launched, the original
instance will create a new window, gain focus, and terminate the
second instance.

<Tip>
If you're using Ghostty on Linux and are experiencing slow startup times
or high memory usage, GTK single instance detection may not be
working for your environment and you may need to force it on.
Continue reading this page to learn more.
</Tip>

## Desktop Environment Detection

The default behavior of Ghostty is to use GTK single instance mode
**when launched from a desktop environment.**

Ghostty has this behavior because CLI terminal usage is common
(i.e. `ghostty -e "some command"`) and in those cases the expected
behavior is to launch a new process and block until it exits.
Single instance mode doesn't allow us to easily do this so we only
want to enable single instance mode when launched from a desktop
environment.

There isn't a standard API to detect if an application is launched
from a desktop environment, so Ghostty uses the following heuristic:

1. The `GIO_LAUNCHED_DESKTOP_FILE_PID` environment variable is set.
   Gnome applications set this variable when launched from a `.desktop`
   file.

2. The PID in `GIO_LAUNCHED_DESKTOP_FILE_PID` matches the pid of
   the Ghostty process. This prevents Ghostty being launched from
   another desktop application from being detected as a desktop
   application.

<Note>
I expect that this heuristic isn't perfect. If you can improve
this, please [start a GitHub discussion](https://github.com/ghostty-org/ghostty/discussions).
During the private beta period of Ghostty, we had around 5,000
beta testers and this heuristic overall worked very well.
</Note>

## Forcing GTK Single Instance Mode On or Off

You can force GTK single instance mode on or off by setting the
[`gtk-single-instance`](/docs/config/reference#gtk-single-instance) option:

```ini
gtk-single-instance = true
```

A value of `true` forces Ghostty to run in single instance mode.
In this mode, each new `ghostty` process will result in a new window
in an existing instance of Ghostty if one is running.

## Relationship to Startup Performance and Memory

Ghostty is a GTK application. The GTK framework has unavoidable
overhead when starting up, both in terms of how long it takes and
how much memory it uses. Ghostty can't do anything about this.

GTK single instance mode avoids this overhead for subsequent
instances of Ghostty. Launching a second instance of Ghostty
will be extremely fast and use very little memory since it is
just creating a new window in the existing instance.
