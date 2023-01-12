# !/bin/bash
sudo php /var/www/html/magento2/bin/magento module:disable Mageplaza_HelloWorld
sudo php /var/www/html/magento2/bin/magento module:status Mageplaza_HelloWorld
echo "Creando frontend/routes.xml"
sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/frontend/routes.xml
sudo nano /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/frontend/routes.xml
echo "Creando Index/Index.php"
sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/Index.php
sudo nano /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/Index.php
echo "Creando layout/helloworld_index_index.xml"
sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/layout/helloworld_index_index.xml
sudo nano /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/layout/helloworld_index_index.xml
echo "Creando Block/Index.php"
sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Block/Index.php
sudo nano /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Block/Index.php
echo "Creando templates/index.phtml"
sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/templates/index.phtml
sudo nano /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/templates/index.phtml



sudo php /var/www/html/magento2/bin/magento module:enable Mageplaza_HelloWorld
sudo php /var/www/html/magento2/bin/magento module:status Mageplaza_HelloWorld
sudo php /var/www/html/magento2/bin/magento setup:upgrade
sudo php /var/www/html/magento2/bin/magento setup:di:compile
sudo php /var/www/html/magento2/bin/magento setup:static-content:deploy es_MX en_US -f
sudo php /var/www/html/magento2/bin/magento cache:clean
sudo php /var/www/html/magento2/bin/magento cache:flush


sudo chown -R www-data:www-data /var/www/html/magento2/
sudo chmod 777 -R /var/www/html/magento2/
echo "Visitar 192.168.0.37/helloworld/index/index"
