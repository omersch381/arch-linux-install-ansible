Core
====

Sets the hostname.

Requirements
------------

Set the 'hostname' variable at host_vars/localhost/vars to the one you prefer, or override it by creating a 'vars' directory for this role (roles/core/vars/main.yaml) and type 
'hostname: MY_HOSTNAME'.

Role Variables
--------------

None, because I preferred to have all the playbook's variables on one place (hence it is on host_vars/localhost/vars and host_vars/localhost/passwords), but as mentioned before, there is a possibility to override this decision by creating a 'vars' directory for this role (roles/core/vars/main.yaml) and type 'hostname: MY_HOSTNAME'.

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
        - core
