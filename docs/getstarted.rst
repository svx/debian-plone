==================
Getting started
==================

How to get started.

.. contents:: :local:

Introduction
--------------

This Writeup is **ONE** Example of hosting `Plone`_, its based on `Debian`_.
There are lots of other ways to do it and lots of other different ideas about setups and
administration.

About Setups
-------------

It does not matter if you install a server for `Plone`_ or an other Application, use always consistent setups/installs.
You always should thing about longterm setups, so thing about the future, this will make it easier if you change or upgrade your 
Application.
Keep also in mind that you have to take care about Hardware failure and Disk space for example.

**You should always use:**

    - `raid`_
    - `lvm`_

The next point which you will have to keep in mind, especially if your Server is located in a Datacenter and not in house, is physically access.
There are situations where you need to have access to server, this *will* happen at some point.
Depending on your setup and the situation of course, if there is really a Hardware failure you will have to go [depends of course on your service contract],
but sometimes there are other things happened like boot loader failure after an upgrade [you should always try to upgrade you test server first].Or by accident you did 
a shutdown and not a reboot [it happens to all of us...].
To save you time, nerves and money use tools like `IPMI`_, further is it always handy to have a boot medium available, there are different ways to solve that.

    - `PXE`_
    - cd/dvd
    - USB-stick
    - Flashcard 


I for example use an combination of `IPMI`_ and `PXE`_ over `VPN`_ and an always connected USB-stick on every physically server. 

.. _Plone: http://www.plone.org
.. _Debian: http://www.debian.org
.. _lvm: http://en.wikipedia.org/wiki/Logical_Volume_Manager_(Linux)
.. _raid: http://http://en.wikipedia.org/wiki/RAID
.. _IPMI: http://en.wikipedia.org/wiki/Intelligent_Platform_Management_Interface
.. _PXE: http://en.wikipedia.org/wiki/Preboot_Execution_Environment
.. _VPN: http://en.wikipedia.org/wiki/OpenVPN
