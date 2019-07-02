# Hosts Drupal 8 Box Vm

## Shared vragrant folder

Here is the `./Apache2 /` folder to share with the folder Apache2 in the linux system `/etc/apache2/sites-enabled`.

```vagrantfile
config.vm.synced_folder "./apache2/", "/etc/apache2/sites-enabled", owner: "root", group: "root", id: 'vhost'
```

## Pretty Urls

If you are setting up your C:\Windows\System32\drivers\etc\hosts, consider changing the `ServerName` and` ServerAlias` preconfiguring the virtual machine.

```
ServerName basic-tiny-box.mm
ServerAlias basic-tiny-box.mm
```

## Root directory

The docroot directory is thought from the perspective of developing a React application, but change the root directory if needed.
```
DocumentRoot /var/www/html/docroot/public
```