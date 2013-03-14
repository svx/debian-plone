==================
Install Plone
==================

Install and Setup `Plone`_

This Writeup is **not** based on the `Unified Installer`_, it is based on your own `Buildouts`_ .

**At the moment this is based on `Plone`_ 4.1.x with python2.6, I need to upgrade this to `Plone`_ 4.2.x with python2.7**

.. contents:: :local:

Introduction
--------------

Now that the Server is installed and running it is time to install and setup `Plone`_

As I wrote before I [you should, too] make a difference between the Server and the Application Layer
[more here]

Install Packages we need
--------------------------

First we will install all Packages which we need to run `Plone`_, **please note**, I will not make a difference between development/staging and production
environment on this writeup in real life you should, since it's always good to just install what you need and not more*

Just use apt-get and install all we need::

    apt-get install wget build-essential wv poppler-utils python2.6-dev python-imaging libssl-dev libjpeg62-dev zlib1g-dev libreadline5-dev libxml2-dev python-libxml2 libxslt1-dev python-libxslt1 cython pkg-config libpcre3 libpcre3-dev xpdf-utils libreadline5 zlib1g  libjpeg62 libssl0.9.8 subversion cron groff-base wget lynx python-dev git-core python-virtualenv subversion-tools htop curl



Depending on your Connection and your Server that will take a couple of moments ...

After that is done it is time to setup a Application User


Setup User for Application [Plone]
------------------------------------

Use sudo to became root or your admin user::

    sudo $admin #admin user
    sudo -i     #root

and now create a user which we will use for `Plone`_ [ploneuser]::

    useradd ploneuser -m -s /bin/bash
    passwd ploneuser


The key you need to transfer to the host is the public one. If you can log in to a computer over SSH using a password, you can transfer your RSA key by doing the following from your own computer:::

    ssh-copy-id <ploneuser>@<host>

Where <username> and <host> should be replaced by your username and the name of the computer you're transferring your key to.

Due a bug, you cannot specify a port other than the standard port 22. You can work around this by issuing the command like this: ssh-copy-id "<ploneuser>@<host> -p <port_nr>". If you are using the standard port 22, you can ignore this tip.

You can make sure this worked by doing:::

    ssh <ploneuser>@<host>

You should be prompted for the passphrase for your key:::

    Enter passphrase for key '/home/<user>/.ssh/id_rsa':

Enter your passphrase, and provided host is configured to allow key-based logins, you should then be logged in as usual.



Allow this user in sshd_config to login

Change Allow Users to::

    # Allow Users
    AllowUsers $Username ploneuser

And restart ssh::

    /etc/init.d/ssh restart

**Make sure that you are always logged in with a second Terminal, in case something goes wrong**



Setup Virtual-Environment
-------------------------

Always run Applications or in other words here `Plone` in its own `Virtual-Environment`_ 

Login as ploneuser::

    ssh ploneuser@host

Create a Directory with the name *bin* in /home/ploneuser::

    mkdir bin

Change into that Dir.::

    cd bin

Since I am lazy I prefer my own Wrapper Script so let's download that::

    wget https://raw.github.com/svx/mkenv26/master/mkenv26.sh .
    chmod +x mkenv26.sh


Create a Directory with the name *sites* in /home/ploneuser::

    mkdir sites

Change into that Dir.::

    cd sites

Create a Virtual-Environment 

    mkenv26.sh www.example.com

**Make sure that ~/bin is in your path !**

After that is done change into that dir::

    cd www.example.com

Activate your Virtual-Environment
----------------------------------

Just do::

    source bin/activate

Clone your Project for example from github::

    git clone git://github.com/svx/Plone-Buildout-Example.git buildout

Change into the right Directory::

    cd buildout

Run Buildout
------------

Tell buildout which config file to use::

    vim [<- choose the editor of your choise] buildout.cfg

    [buildout]
    extends = config/development.cfg

Booststrap and Compile::

    python bootstrap.py
    bin/buildout

And start it with::

    bin/instance fg




.. _Plone: http://www.plone.org
.. _Buildouts: http://www.buildout.org/
.. _Unified Installer: http://plone.org/documentation/manual/installing-plone/installing-on-linux-unix-bsd/what-is-the-unified-installer
.. _Virtual-Environment: http://pypi.python.org/pypi/virtualenv
