# !/bin/bash
sudo php /var/www/html/magento2/bin/magento module:disable Mageplaza_HelloWorld
sudo php /var/www/html/magento2/bin/magento module:status Mageplaza_HelloWorld
#sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/frontend/routes.xml
sudo cp routes.xml /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/frontend/
echo "Creando Index/Index.php"
#sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/Index.php
sudo cp Index.php /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/
echo "Creando layout/helloworld_index_index.xml"
#sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/layout/helloworld_index_index.xml
sudo cp helloworld_index_index.xml /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/layout/
echo "Creando Block/Index.php"
#sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Block/Index.php
sudo cp block/Index.php /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Block/
echo "Creando templates/index.phtml"
#sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/templates/index.phtml
sudo cp index.phtml /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/templates/



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
