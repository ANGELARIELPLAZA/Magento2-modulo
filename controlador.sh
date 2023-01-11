# !/bin/bash
# Programa para hacer modulos
sudo mkdir -p /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/Setup/
sudo mkdir -p /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/Model/
sudo mkdir -p /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/Model/ResourceModel/
sudo mkdir -p /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/Model/ResourceModel/Post/
sudo mkdir -p /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/Controller/Index/
#Step 1: Setup Script
sudo cp crud/InstallSchema.php crud/UpgradeSchema.php crud/UpgradeData.php crud/InstallData.php /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/Setup/
sudo rm /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/etc/
sudo cp crud/module.xml  /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/etc/
sudo php /var/www/html/magento2/bin/magento setup:upgrade
sudo php /var/www/html/magento2/bin/magento setup:static-content:deploy es_MX en_US -f

#Step 2: Create Model
sudo cp crud/Post.php  /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/Model/
#Step 3: Create Resource Model
sudo cp crud/ResourceModel/Post.php /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/Model/ResourceModel/
#Step 4: Create Resource Model Collection
sudo cp crud/Collection.php  /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/Model/ResourceModel/Post/
#Step 5: Factory Object
sudo rm /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/Controller/Index/
sudo cp crud/Index.php /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/Controller/Index/
sudo php /var/www/html/magento2/bin/magento setup:di:compile
sudo php /var/www/html/magento2/bin/magento setup:upgrade
sudo php /var/www/html/magento2/bin/magento setup:static-content:deploy es_MX en_US -f
sudo php /var/www/html/magento2/bin/magento indexer:reindex
sudo php /var/www/html/magento2/bin/magento cache:clean
sudo php /var/www/html/magento2/bin/magento cache:flush
sudo chown -R www-data:www-data /var/www/html/magento2/
sudo chmod 777 -R /var/www/html/magento2/

#sudo php /var/www/html/magento2/bin/magento  module:uninstall Tresdadv_MiPrimerCrud