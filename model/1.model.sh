# !/bin/bash
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/adminhtml
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/frontend
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Block/Adminhtml
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Setup/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Model/Indexer
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/layout/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/templates/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Model/ResourceModel/Post/

echo "Creando etc/module.xml"
#sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/module.xml
sudo cp module.xml /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/
echo "Creando HelloWorld/registration.php"
#sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/registration.php
sudo cp registration.php  /var/www/html/magento2/app/code/Mageplaza/HelloWorld/
echo "Creando frontend/routes.xml"
#sudo touch  /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/frontend/routes.xml
sudo cp routes.xml /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/frontend/
echo "Creando Index/Test.php"
#sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/Test.php
sudo cp Test.php  /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/

sudo php /var/www/html/magento2/bin/magento module:status
sudo php /var/www/html/magento2/bin/magento setup:upgrade
sudo php /var/www/html/magento2/bin/magento setup:di:compile
sudo php /var/www/html/magento2/bin/magento setup:static-content:deploy es_MX en_US -f
sudo php /var/www/html/magento2/bin/magento cache:clean
sudo php /var/www/html/magento2/bin/magento cache:flush


sudo chown -R www-data:www-data /var/www/html/magento2/
sudo chmod 777 -R /var/www/html/magento2/

#http://192.168.0.37/helloworld/index/test
