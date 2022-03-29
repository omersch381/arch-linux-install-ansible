Graphics
========

This role installs and configures everything which is related to graphics.

Requirements
------------

Have a 'host_vars/localhost/vars' file, which will have the variable 
'hostname: YOUR_HOSTNAME'.

Role Variables
--------------

xinitrc_path which is set to /home/{{ hostname }}/.xinitrc.

Dependencies
------------

None.

Example Playbook
----------------

Just mention the role in the site.yml playbook:

    - name: Install and configure arch linux
      connection: local
      hosts: localhost
      roles:
        - graphics
