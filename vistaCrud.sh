#Step 3: Create block
sudo rm /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/Block/
sudo cp viewCrud/Block/Display.php /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/Block/
#Step 4. Create template file
sudo rm /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/view/frontend/templates/
sudo cp viewCrud/sayhello.phtml /var/www/html/magento2/app/code/Tresdadv/MiPrimerCrud/view/frontend/templates/

sudo php /var/www/html/magento2/bin/magento  module:enable Tresdadv_MiPrimerCrud
sudo php /var/www/html/magento2/bin/magento setup:di:compile
sudo php /var/www/html/magento2/bin/magento setup:upgrade
sudo php /var/www/html/magento2/bin/magento setup:static-content:deploy es_MX en_US -f
sudo php /var/www/html/magento2/bin/magento indexer:reindex
sudo php /var/www/html/magento2/bin/magento cache:clean
sudo php /var/www/html/magento2/bin/magento cache:flush
sudo chown -R www-data:www-data /var/www/html/magento2/
sudo chmod 777 -R /var/www/html/magento2/