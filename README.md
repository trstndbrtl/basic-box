# <a id="box">Basic Box</a>
env builded by trstndbrtl with http://revuesdecode.com

#### <a id="sommaire">Sommaire</a>
[Prerequisites](#prerequis)
[Provision](#provision)
[Mysql credentials](#mysql)
[Adminer connexion](#adminer)

## <a id="prerequis">Prerequisites</a>
- virtualbox >= 5.2
- Vagrant 2.2.4
- Vagrant-hostsupdater (1.1.1.160, global)
- Vagrant-vbguest (0.18.0, global)
- [^^](#sommaire)

## <a id="provision">Provisions</a>
- Ubuntu Ubuntu Bionic 18.04
- Apache 2.4.29
- Mysql 5.7.26
- PHP 7.2.19
- Adminer 4.7.1^
- [^^](#sommaire)

## <a id="process">Process</a>
- 1 Clone the projet
- 2 Run `vagrant up`
- 3 Modifie, add, remove configuration in box with `vagrant ssh`
- [^^](#sommaire)

## <a id="mysql">Mysql credentials</a>
- Username : root
- Password : root
- [^^](#sommaire)

## <a id="adminer">Adminer</a>
- Login with Mysql credentials
- Go http://<-ip-machine->/adminer.php
- [^^](#sommaire)
