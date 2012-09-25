===========
Backup
===========

Making backups is one of the main responsibilities of any administrator besides `Monitoring <https://github.com/svx/conf2012/blob/master/docs/monitoring.rst>`_, but it is a complex subject, involving powerful tools which are often difficult to master. 

.. contents:: :local:

Introduction
--------------

Many programs exist, such as `amanda`_, a client/server system featuring many options, whose configuration is rather difficult. `BackupPC`_ is also a client/server solution, but with a web interface for configuration which makes it more user-friendly. Dozens of other `Debian`_ packages are dedicated to backup solutions, as you can easily confirm with::

    apt-cache search backup


For more information, check the `Debian Handbook`_

.. _amanda: http://www.amanda.org/
.. _BackupPC: http://backuppc.sourceforge.net/
.. _Debian: http://www.debian.org/
.. _Debian Handbook: http://debian-handbook.info/browse/stable/

