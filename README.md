=======
iMacMonitor - Enter Target Mode programatically
=========== 

* License: MIT license (bogner.sh)
* Original site: http://bogner.sh/2013/07/os-x-how-to-use-an-imac-as-monitor/#comment-50925
* Repo: Placed on github.com/lsd for convenience and for my own edits
* Desc: Set to run on login with auto-login account to turn iMac into a permanent external display without 
needing a keyboard

**This is for Xcode5 and OS X 10.9. For older releases, the `pre-10.9` directory**

*This is originally from <http://bogner.sh/2013/07/os-x-how-to-use-an-imac-as-monitor/#comment-50925> All original links preserved*

### How to use an iMac as Monitor

Think about the following rather unusual scenario: You own a current
generation MacBook Air and a new iMac that you don't use. This blog post
will show you how you can use the iMac as a pure monitor without any
manual intervention.

Introduction
============

The current generation iMacs (21" and 27") can be used as a Thunderbolt
display using [Target Display Mode](http://support.apple.com/kb/ph4469).
To enabled this mode you have to boot both Macs and connect them using a
Thunderbolt cable. After that you have to press [Command]+[F2] on the
keyboard of the "display" iMac. Although this feature is great for rare
usage – it’s not very comfortable if you want to use the iMac as a
permanent secondary display.

iMacMonitor
===========

[![thunderbolt-logo](http://bogner.sh/wp-content/uploads/2013/07/thunderbolt-logo-150x150.jpg)](http://bogner.sh/wp-content/uploads/2013/07/thunderbolt-logo.jpg)To
solve this problem I created iMacMonitor. It’s a small application
running on the “display” iMac that monitors the Thunderbolt bus and
automatically switches to Target Display Mode if necessary. Thereby one
only has to connect the main computer to the Thunderbolt cable and a few
seconds later the iMac can be used as a secondary monitor. This works
because Mac’s wake from standby if a Thunderbolt device is connected. As
soon as the main computer is disconnected the display will sleep again.
Be aware that you should not shutdown the “display” computer as it won’t
switch to Target Display Mode anymore.

Setup
-----

1.  First you have to
    download [iMacMonitor.app](http://bogner.sh/wp-content/uploads/2013/07/iMacMonitor.app_.zip) on
    the "display" iMac and set it as Login Item.  
2.  Then make sure that a user is automatically logged in (see this  
    [link](http://support.apple.com/kb/PH10650?viewlocale=en_US)).
3.  Restart  
4.  Voilà  

Now you can connect a Thunderbolt enabled Mac and the “display” iMac  
will switch to Target Display Mode automatically.  

Sourcecode
----------

As I have written this application for fun you can also download the  
[Xcode project](http://bogner.sh/wp-content/uploads/2013/07/iMacMonitor_Source.zip).  
It’s released under the MIT licence.  

Update: [Here’s the Xcode 5 Project for 10.9](http://bogner.sh/wp-content/uploads/2013/07/iMacMonitor_Source109.zip)

