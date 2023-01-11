#Step 1: Create the folder of Hello World module
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/frontend/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/layout/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Block/
sudo mkdir -p  /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/templates/

#Step 2: Create etc/module.xml file.
sudo mv modulo/module.xml  /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/
#Step 3: Create etc/registration.php file
sudo mv modulo/registration.php /var/www/html/magento2/app/code/Mageplaza/HelloWorld/
#Step 4: Enable the module
sudo php /var/www/html/magento2/bin/magento module:status
sudo php /var/www/html/magento2/bin/magento module:enable Mageplaza_HelloWorld
cat  /var/www/html/magento2/app/etc/config.php
sudo php /var/www/html/magento2/bin/magento setup:upgrade
sudo php /var/www/html/magento2/bin/magento setup:static-content:deploy -f


#Create Controller in Magento 2
#Step 1: Create routes.xml file
sudo mv modulo/routes.xml  /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/frontend/
#Step 2: Create controller file
sudo mv modulo/Index.php /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/
#Step 3: Create controller Layout file
sudo mv modulo/helloworld_index_index.xml /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/layout/
#Step 4: Create controller Block file
sudo mv modulo/Block/Index.php /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Block/
#Step 5: Create controller template file
sudo mv modulo/index.phtml /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/templates/
#Step 6: Flush Magento cache
sudo php /var/www/html/magento2/bin/magento cache:clean
sudo php /var/www/html/magento2/bin/magento cache:flush
sudo php /var/www/html/magento2/bin/magento cache:status
sudo php /var/www/html/magento2/bin/magento setup:di:compile
sudo php /var/www/html/magento2/bin/magento setup:static-content:deploy es_MX en_US -f
sudo chown -R www-data:www-data /var/www/html/magento2/
sudo chmod 777 -R /var/www/html/magento2/
#Step 7: Run a test new controller

