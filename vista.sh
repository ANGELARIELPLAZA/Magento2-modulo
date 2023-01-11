# !/bin/bash
# Programa para hacer vistas
sudo php /var/www/html/magento2/bin/magento  module:disable Tresdadv_MiPrimerCrud

sudo mkdir -p /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/view/frontend/layout/
sudo mkdir -p /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/Block/
sudo mkdir -p /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/view/frontend/templates/

#Step 1: Create controller
sudo cp view/Display.php /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/Controller/Index/
#Step 2: Create layout file .xml
sudo cp view/MiPrimerCrud_index_display.xml /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/view/frontend/layout/
#Step 3: Create block
sudo cp view/Block/Display.php /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/Block/
#Step 4. Create template file
sudo cp view/sayhello.phtml /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/view/frontend/templates/

sudo php /var/www/html/magento2/bin/magento  module:enable Tresdadv_MiPrimerCrud
sudo php /var/www/html/magento2/bin/magento setup:di:compile
sudo php /var/www/html/magento2/bin/magento setup:upgrade
sudo php /var/www/html/magento2/bin/magento setup:static-content:deploy es_MX en_US -f
sudo php /var/www/html/magento2/bin/magento indexer:reindex
sudo php /var/www/html/magento2/bin/magento cache:clean
sudo php /var/www/html/magento2/bin/magento cache:flush
sudo chown -R www-data:www-data /var/www/html/magento2/
sudo chmod 777 -R /var/www/html/magento2/


