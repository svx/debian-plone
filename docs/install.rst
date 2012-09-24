==================
Setup Debian
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


Setup Administration User
--------------------------

Since there is no reason to use root, setup a new $User for administration tasks and give this $User the
right permissions [sudo]::

    useradd $Username -m -s /bin/bash
    passwd $Username

Install sudo::

    apt-get install sudo

Configure sudo give the new $User the right permissions::

    visudo

And at the line::

    # User privilege specification

Add your new $User::

    $Username     ALL=(ALL:ALL) ALL

For more info just do::

    man sudo

Upload the $User key to the server

Using key based logins with ssh is generally considered more secure than using plain password logins. This section of the guide will explain the process of generating a set of public/private RSA keys, and using them for logging into your Ubuntu computer(s) via OpenSSH.

The first step involves creating a set of RSA keys for use in authentication.

This should be done on the client.

To create your public and private SSH keys on the command-line::

    mkdir ~/.ssh
    chmod 700 ~/.ssh
    ssh-keygen -t rsa

You will be prompted for a location to save the keys, and a passphrase for the keys. This passphrase will protect your private key while it's stored on the hard drive and be required to use the keys every time you need to login to a key-based system::

    Generating public/private rsa key pair.
    Enter file in which to save the key (/home/b/.ssh/id_rsa):
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in /home/b/.ssh/id_rsa.
    Your public key has been saved in /home/b/.ssh/id_rsa.pub.

Your public key is now available as .ssh/id_rsa.pub in your home folder.

Congratulations! You now have a set of keys. Now it's time to make your systems allow you to login with them

Just like with physical keys, you need to change all your locks if your RSA key is stolen. Otherwise, your thief will be able to get access to all your stuff.

An SSH key passphrase is a secondary form of security that gives you a little time when your keys are stolen. If your RSA key has a strong passphrase, it might take your attacker a few hours to guess by brute force. That extra time should be enough to log in to any computers you have an account on, delete your old key from the .ssh/authorized_keys file, and add a new key.

Your SSH key passphrase is only used to protect your private key from thieves. It's never transmitted over the Internet, and the strength of your key has nothing to do with the strength of your passphrase.

You have to choose for yourself whether to use a passphrase with your RSA key. Ultimately, it's a choice between cursing the difficulty every time you have to type it in, or cursing your glibness when someone logs in to all your accounts and changes your password so you can't get in any more.

If you choose to use a passphrase, pick something strong and write it down on a piece of paper that you keep in a safe place. If you choose not to use a password, just press the return key without typing a password - you'll never be asked for one again.

*Note*: The default is a 2048 bit key. You can increase this to 4096 bits with the -b flag (Increasing the bits makes it harder to crack the key by brute force methods).::

    ssh-keygen -t rsa -b 4096

The main problem with public key authentication is that you need a secure way of getting the public key onto a computer before you can log in with it. If you will only ever use an SSH key to log in to your own computer from a few other computers (such as logging in to your PC from your laptop), you should copy your SSH keys over on a memory stick, and disable password authentication altogether. If you would like to log in from other computers from time to time (such as a friend's PC), make sure you have a strong password.

The key you need to transfer to the host is the public one. If you can log in to a computer over SSH using a password, you can transfer your RSA key by doing the following from your own computer:::

    ssh-copy-id <username>@<host>

Where <username> and <host> should be replaced by your username and the name of the computer you're transferring your key to.

Due a bug, you cannot specify a port other than the standard port 22. You can work around this by issuing the command like this: ssh-copy-id "<username>@<host> -p <port_nr>". If you are using the standard port 22, you can ignore this tip.

You can make sure this worked by doing:::

    ssh <username>@<host>

You should be prompted for the passphrase for your key:::

    Enter passphrase for key '/home/<user>/.ssh/id_rsa':

Enter your passphrase, and provided host is configured to allow key-based logins, you should then be logged in as usual.



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


`Bitcron`_::

    echo "deb http://ppa.launchpad.net/f-launchpad-bit-nl/bitcron/ubuntu lucid main" >> /etc/apt/sources.list.d/bitcron.list
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 69F5F7DC09128850
    apt-get update
    apt-get install bitcron
    mkdir /usr/share/doc/bitcron/examples && mv /etc/cronscripts/*cron /usr/share/doc/bitcron/examples

Automatic updates
------------------
Security updates will be done automatically and **only** Security updates::

    echo "unattended-upgrades unattended-upgrades/enable_auto_updates boolean true" | debconf-set-selections
    apt-get install unattended-upgrades

Edit */etc/apt/apt.conf.d/50unattended-upgrades:*::

    Unattended-Upgrade::Allowed-Origins {
        "${distro_id} stable";
        "${distro_id} ${distro_codename}-security";
    };

    Unattended-Upgrade::Mail "$ADMIN@$EXAMPLE.COM";



SSH
---
I like to disable root access in my ssh configs and only give access to allowed $Users, an example is under [configs/ssh-make this a link]

Edit /etc/ssh/sshd/sshd_config::

    # Authentication:
    LoginGraceTime 120
    PermitRootLogin no
    StrictModes yes

    # Allow Users
    AllowUsers $Username

And restart ssh::

    /etc/inint.d/ssh restart

**Make sure that you are always logged in with a second Terminal, in case something goes wrong**
    






.. _Debian: http://www.debian.org
.. _Virtualization: http://en.wikipedia.org/wiki/Virtualization
.. _LVM: http://en.wikipedia.org/wiki/Logical_Volume_Manager_(Linux)
.. _RAID: http://http://en.wikipedia.org/wiki/RAID
.. _SWAP: http://wiki.debian.org/Swap
.. _Handbook: http://debian-handbook.info/browse/stable/
.. _smartmontools: http://en.wikipedia.org/wiki/Smartmontools
.. _openntpd: http://www.openntpd.org/
.. _Bitcron: https://launchpad.net/~f-launchpad-bit-nl/+archive/bitcron
