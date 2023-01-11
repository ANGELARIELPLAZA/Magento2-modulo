# !/bin/bash
# Programa para hacer modulos
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Setup/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Model/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Model/ResourceModel/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Model/ResourceModel/Post/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/
#Step 1: Setup Script
sudo mv crud/InstallSchema.php /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Setup/
sudo rm /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/
sudo mv crud/module.xml  /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/
sudo mv crud/UpgradeSchema.php /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Setup/
sudo mv crud/UpgradeData.php /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Setup/
sudo php /var/www/html/magento2/bin/magento setup:upgrade
sudo php /var/www/html/magento2/bin/magento setup:static-content:deploy es_MX en_US -f
sudo mv crud/InstallData.php /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Setup/
#Step 2: Create Model
sudo mv crud/Post.php  /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Model/
#Step 3: Create Resource Model
sudo mv crud/ResourceModel/Post.php /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Model/ResourceModel/
#Step 4: Create Resource Model Collection
sudo mv crud/Collection.php  /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Model/ResourceModel/Post/
#Step 5: Factory Object
sudo rm /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/
sudo mv crud/Index.php /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/
sudo php /var/www/html/magento2/bin/magento setup:di:compile
sudo php /var/www/html/magento2/bin/magento setup:upgrade
sudo php /var/www/html/magento2/bin/magento setup:static-content:deploy es_MX en_US -f
sudo php /var/www/html/magento2/bin/magento indexer:reindex
sudo php /var/www/html/magento2/bin/magento cache:clean
sudo php /var/www/html/magento2/bin/magento cache:flush
sudo chown -R www-data:www-data /var/www/html/magento2/
sudo chmod 777 -R /var/www/html/magento2/

#sudo php /var/www/html/magento2/bin/magento  module:uninstall Mageplaza_HelloWorld