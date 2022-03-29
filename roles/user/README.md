User
====

This role takes care of the non root user, creates the wheel group and assigns the non root user some sudo permissions.

Requirements
------------

Have a 'host_vars/localhost/passwords' file, which will have the variable 
'non_root_password: YOUR_NON_ROOT_PASSWORD'.
And have a 'host_vars/localhost/vars' file, which will have the variable 
'hostname: YOUR_HOSTNAME'.

Role Variables
--------------

None, because I preferred to have all the playbook's variables on one place (hence it is on host_vars/localhost/vars and host_vars/localhost/passwords).

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
        - user
