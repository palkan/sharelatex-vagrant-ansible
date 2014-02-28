## About

VM configuration for [ShareLaTeX](https://www.sharelatex.com) development

Installs:

* Required system packages
* MongoDB (from packages)
* Redis (from source)
* NodeJS (+ npm, grunt) (from source)
* TexLive
* git clone [ShareLaTeX](https://github.com/sharelatex/sharelatex) master 

## Requirements

* Vagrant >=1.4
* VirtualBox >=4.0
* [Ansible](http://docs.ansible.com/intro_installation.html)

## Setup

* ```vagrant up``` that's all!

## Options
There are several configuration parameters available to edit in [development.yml](https://github.com/palkan/sharelatex-vagrant-ansible/blob/master/priv/ansible/group_vars/development.yml) such as project root, node and redis versions, sharelatex repo url etc.

## Run 
Login into VM (```vagrant ssh```).
Navigate to project root (default - '/webapps/sharelatex').
Run ```grunt run```

### Possible issues

* ```The guest additions on this VM do not match the installed version of
VirtualBox!```
	Solve with plugin: ```vagrant plugin install vagrant-vbguest```