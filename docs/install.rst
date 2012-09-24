==================
Getting started
==================

Basic Server Install

.. contents:: :local:

Introduction
--------------

This is just an example of an Basic Install of your Server, this is based on `Debian`_ 6 aka Squeeze.
This example is meant for a 'Barebone' Server and not for a setup with `Virtualization`_, this I will cover later on.

Install
---------

I will not cover the whole installation process, just follow the Installer and do not forget to setup you install with `RAID`_ and `LVM`_, also do not forget to give you server
enough `SWAP`_

For more Information about Installation check the `Handbook`_

There are some packages, which I always install after my Basic Install is finished:

    - `smartmontools`_ 

Just use apt-get to do that::

    apt-get install smartmontools

in /etc/default/smartmontools, uncomment::

    start_smartd=yes

The Next step is to add the backports-repository to install `openntpd`_::

    echo "deb http://ftp.nl.debian.org/debian-backports squeeze-backports main" > /etc/apt/sources.list.d/backports.list
    apt-get update
    apt-get install openntpd




.. _Debian: http://www.debian.org
.. _Virtualization: http://en.wikipedia.org/wiki/Virtualization
.. _LVM: http://en.wikipedia.org/wiki/Logical_Volume_Manager_(Linux)
.. _RAID: http://http://en.wikipedia.org/wiki/RAID
.. _SWAP: http://wiki.debian.org/Swap
.. _Handbook: http://debian-handbook.info/browse/stable/
.. _smartmontools: http://en.wikipedia.org/wiki/Smartmontools
.. _openntpd: http://www.openntpd.org/
