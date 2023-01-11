# !/bin/bash
# Programa para hacer vistas
sudo php /var/www/html/magento2/bin/magento  module:disable Mageplaza_HelloWorld

sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Setup/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Model/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Model/ResourceModel/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Model/ResourceModel/Post/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/layout/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Block/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/templates/

#Step 1: Create controller
sudo mv view/Display.php /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/
#Step 2: Create layout file .xml
sudo mv view/helloworld_index_display.xml /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/layout/
#Step 3: Create block
sudo mv view/Block/Display.php /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Block/
#Step 4. Create template file
sudo mv view/sayhello.phtml /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/templates/

sudo php /var/www/html/magento2/bin/magento  module:enable Mageplaza_HelloWorld
sudo php /var/www/html/magento2/bin/magento setup:upgrade
sudo php /var/www/html/magento2/bin/magento setup:di:compile
sudo php /var/www/html/magento2/bin/magento setup:static-content:deploy es_MX en_US -f
sudo php /var/www/html/magento2/bin/magento indexer:reindex
sudo php /var/www/html/magento2/bin/magento cache:clean
sudo php /var/www/html/magento2/bin/magento cache:flush
sudo chown -R www-data:www-data /var/www/html/magento2/
sudo chmod 777 -R /var/www/html/magento2/


