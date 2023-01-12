# !/bin/bash
sudo php /var/www/html/magento2/bin/magento module:disable Mageplaza_HelloWorld
sudo php /var/www/html/magento2/bin/magento module:status Mageplaza_HelloWorld
echo "Creando Setup/InstallSchema.php"
sudo cat /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Setup/InstallSchema.php
sudo nano /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Setup/InstallSchema.php
echo "Creando etc/module.xml"
sudo cat /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/module.xml
sudo nano /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/module.xml
echo "Creando UpgradeSchema.php"
sudo cat /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Setup/UpgradeSchema.php
sudo nano /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Setup/UpgradeSchema.php
echo "Creando InstallData.php"
sudo cat /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Setup/InstallData.php
sudo nano /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Setup/InstallData.php
#echo "Creando UpgradeData.php"
sudo cat /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Setup/UpgradeData.php
#sudo nano /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Setup/UpgradeData.php

sudo php /var/www/html/magento2/bin/magento setup:upgrade
sudo php /var/www/html/magento2/bin/magento setup:static-content:deploy es_MX en_US -f

echo "Creando Model/Post.php"
sudo cat /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Model/Post.php
sudo nano /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Model/Post.php
echo "Creando ResourceModel/Post.php"
sudo cat /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Model/ResourceModel/Post.php
sudo nano /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Model/ResourceModel/Post.php
echo "Creando Post/Collection.php"
sudo cat /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Model/ResourceModel/Post/Collection.php
sudo nano /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Model/ResourceModel/Post/Collection.php
echo "Creando Index/Index.php"
sudo cat /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/Index.php
sudo nano /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/Index.php

sudo php /var/www/html/magento2/bin/magento indexer:reindex
sudo php /var/www/html/magento2/bin/magento module:enable Mageplaza_HelloWorld
sudo php /var/www/html/magento2/bin/magento module:status Mageplaza_HelloWorld
sudo php /var/www/html/magento2/bin/magento setup:upgrade
sudo php /var/www/html/magento2/bin/magento setup:di:compile
sudo php /var/www/html/magento2/bin/magento setup:static-content:deploy es_MX en_US -f
sudo php /var/www/html/magento2/bin/magento cache:clean
sudo php /var/www/html/magento2/bin/magento cache:flush
sudo chown -R www-data:www-data /var/www/html/magento2/
sudo chmod 777 -R /var/www/html/magento2/