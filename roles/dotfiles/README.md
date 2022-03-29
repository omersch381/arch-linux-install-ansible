Dotfiles
========

Clones a dotfiles repo and checks-out to it (so the final result will be that the dotfiles which are under git version control in that repo will be appended/replace the ones on the --work-tree - see lines 17-18).

Requirements
------------

Have a 'host_vars/localhost/passwords' file, which will have the variable 
'github_token: YOUR_GITHUB_TOKEN'.
And have a 'host_vars/localhost/vars' file, which will have the variable 
'hostname: YOUR_HOSTNAME', and 'dotfiles_git_repo: YOUR_REPO_URL', and 'github_username: YOUR_GITHUB_USERNAME'.

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
        - dotfiles
