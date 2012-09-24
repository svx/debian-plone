=========
Webserver
=========

`Plone`_ can run with lots of different Webserver, I prefer `Nginx`_

.. contents:: :local:

Introduction
--------------

Unfortunately is the Version of `Nginx`_ in the default `Debian`_ repositories a bit outdated, same goes for the versions on `Debian Backports`_. That is the reason why I prefer the version from `Dotdeb`_.

Install
---------

Using `Dotdeb`_ is very simple:

Add `Dotdeb`_ to your sources list::

    sudo -i
    cd /etc/apt/sourceslist.d

vim dotdeb.list::

    deb http://packages.dotdeb.org squeeze all
    deb-src http://packages.dotdeb.org squeeze all
    apt-get update
    apt-get install nginx

.. _Plone: http://www.plone.org
.. _Nginx: http://nginx.org/
.. _Webserver: http://en.wikipedia.org/wiki/Comparison_of_web_server_software
.. _Debian: htp://www.debian.org
.. _Debian Backports: http://backports-master.debian.org/
.. _Dotdeb: http://www.dotdeb.org/
