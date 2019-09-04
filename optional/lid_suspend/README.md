# Suspend After Lid Closed

## Purpose

For some reason, the suspend option in xfce4-power-manager does not lock the screen. So I make this workaround to suspend after closing the laptop lid and make sure the screen is locked.



## Requirements

1. Set the option "When laptop lid is closed" to "Lock screen", so that your screen would be locked before this workaround.
2. `sudo` permission.



# How to Use

1. Edit the `.conf` file to configure when you want to suspend. (By default, it only suspends when the laptop is not charging.)
2. Run `bash install.sh` to setup this workaround. You can update your configuration after setup by this command too.
3. If you want to remove this, just run `bash uninstall.sh`.

