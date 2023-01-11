#Step 1: Create the folder of Hello World module
sudo mkdir -p /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/etc/frontend/
sudo mkdir -p /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/Controller/Index/
sudo mkdir -p /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/view/frontend/layout/
sudo mkdir -p /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/Block/
sudo mkdir -p  /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/view/frontend/templates/

#Step 2: Create etc/module.xml file.
sudo cp modulo/module.xml  /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/etc/
#Step 3: Create etc/registration.php file
sudo cp modulo/registration.php /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/
#Step 4: Enable the module
sudo php /var/www/html/magento2/bin/magento module:status
sudo php /var/www/html/magento2/bin/magento module:enable Tresdadv_MiPrimerCrud
cat  /var/www/html/magento2/app/etc/config.php
sudo php /var/www/html/magento2/bin/magento setup:upgrade
sudo php /var/www/html/magento2/bin/magento setup:static-content:deploy -f


#Create Controller in Magento 2
#Step 1: Create routes.xml file
sudo cp modulo/routes.xml  /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/etc/frontend/
#Step 2: Create controller file
sudo cp modulo/Index.php /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/Controller/Index/
#Step 3: Create controller Layout file
sudo cp modulo/MiPrimerCrud_index_index.xml /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/view/frontend/layout/
#Step 4: Create controller Block file
sudo cp modulo/Block/Index.php /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/Block/
#Step 5: Create controller template file
sudo cp modulo/index.phtml /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/view/frontend/templates/
#Step 6: Flush Magento cache
sudo php /var/www/html/magento2/bin/magento cache:clean
sudo php /var/www/html/magento2/bin/magento cache:flush
sudo php /var/www/html/magento2/bin/magento module:status
sudo php /var/www/html/magento2/bin/magento setup:di:compile
sudo php /var/www/html/magento2/bin/magento setup:upgrade
sudo php /var/www/html/magento2/bin/magento setup:static-content:deploy es_MX en_US -f
sudo chown -R www-data:www-data /var/www/html/magento2/
sudo chmod 777 -R /var/www/html/magento2/
#Step 7: Run a test new controller

