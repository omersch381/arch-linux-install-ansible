Packages
========

This role installs yay (Yet another yogurt - a pacman wrapper), and installs all packages from the dotfiles repo.
Note: the packages role does not depend on the dotfiles repository, as the dotfiles role takes care of spitting the list of packages in /home/{{ hostname }}/.config/yay/packages.
In other words: it does not depend on the repo itself, but it does depend on the dotfiles role. 

Requirements
------------

Have a 'host_vars/localhost/vars' file, which will have the variable 
'hostname: YOUR_HOSTNAME'.

Role Variables
--------------

None, because I preferred to have all the playbook's variables on one place (hence it is on host_vars/localhost/vars).

Dependencies
------------

Dotfiles role.

Example Playbook
----------------

Mention the role in the site.yml playbook, after the dotfiles role:

    - name: Install and configure arch linux
      connection: local
      hosts: localhost
      roles:
        - dotfiles
        - packages
