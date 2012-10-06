============
Monitoring
============

Monitoring your Box, you want to get notified **before** something is going **really** bad

.. contents:: :local:

Introduction
--------------

Monitoring is besides a **working** `backup <https://github.com/svx/conf2012/blob/master/docs/backup.rst>`_ the most important thing, you really want to know in time when something is going
bad.

That means you want to get notified from your server, the key is to have a setup which will give your the right information in time
.
You want to sort your information flow and also the way how you get the messages, a got start for example could be::

    - Critical
    - Important
    - Warning

=================
Monitoring Tools
=================

Like always there are lots of different Solutions for Monitoring

    `Munin`_

    `Nagios`_
    
    `Icinga`_
    
    `Monit`_
    
    `Zenoss`_
    
    `Zabbix`_
    
    `Schinken`_
    
    `Gangila`_

    `ZPS`_

These listed are only a few

.. _Munin: http://munin-monitoring.org/
.. _Nagios: http://www.nagios.org/
.. _Icinga: https://www.icinga.org/
.. _Monit: http://mmonit.com/monit/
.. _Zenoss: http://www.zenoss.com/
.. _Zabbix: http://www.zabbix.com/
.. _Schinken: http://www.shinken-monitoring.org/
.. _Gangila: http://ganglia.sourceforge.net/
.. _ZPS: https://github.com/ale-rt/rt.zps
