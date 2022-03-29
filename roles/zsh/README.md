Zsh
===

Installs and configures zsh, oh-my-zsh and the usage of powerlevel0k theme for the non root user.

Requirements
------------

Have a 'host_vars/localhost/vars' file, which will have the variable 
'hostname: YOUR_HOSTNAME'.

Role Variables
--------------

None.

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
        - zsh