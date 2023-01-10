# !/bin/bash
# Programa para hacer modulos
sudo php /var/www/html/magento2/bin/magento deploy:mode:set developer

sudo mkdir -p /var/www/html/magento2/app/code/primer/modulo/etc
sudo touch /var/www/html/magento2/app/code/primer/modulo/registration.php
sudo touch /var/www/html/magento2/app/code/primer/modulo/etc/module.xml

sudo nano  /var/www/html/magento2/app/code/primer/modulo/etc/module.xml
<?xml version="1.0"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:Module/etc/module.xsd">
<module name="primer_modulo" setup_version="1.0.0" >

</module>
</config>

sudo nano /var/www/html/magento2/app/code/primer/modulo/registration.php
<?php
use Magento\Framework\Component\ComponentRegistrar;
ComponentRegistrar::register(ComponentRegistrar::MODULE, 'primer_modulo', __DIR__);


sudo php /var/www/html/magento2/bin/magento setup:upgrade
sudo php /var/www/html/magento2/bin/magento module:status primer_modulo
sudo php /var/www/html/magento2/binphp bin/magento c:c
php bin/magento c:f

sudo php bin/magento setup:di:compile



