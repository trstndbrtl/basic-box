# Basic Box
env builded by trstndbrtl with http://revuesdecode.com

## Prerequisites
- virtualbox >= 5.2
- Vagrant 2.2.4
- Vagrant-hostsupdater (1.1.1.160, global)
- Vagrant-vbguest (0.18.0, global)

## Provisions
- Ubuntu Ubuntu Bionic 18.04
- Apache 2.4.29
- Mysql 5.7.26
- PHP 7.2.19
- Adminer 4.7.1

## Process
1 Clone the projet
2 Run `vagrant up`
3 Modifie, add, remove configuration in box with `vagrant ssh`

## Mysql credentials
Username : root
Password : root

## Adminer
Login in with mysql credentials
http://<-ip-machine->/adminer.php
