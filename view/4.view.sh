echo "Creando Index/Display.php"
sudo cp Display.php /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/
echo "layout/helloworld_index_display.xml"
sudo cp helloworld_index_display.xml /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/layout/
echo "Block/Display.php"
sudo cp Block/Display.php /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Block/
echo "templates/sayhello.phtml"
sudo cp sayhello.phtml /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/templates/