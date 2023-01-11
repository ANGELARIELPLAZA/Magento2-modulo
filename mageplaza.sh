#Step 1: Create the folder of Hello World module
cd /var/www/html/magento2/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/frontend/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/layout/
sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Block/
sudo mkdir -p  /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/templates/

#Step 2: Create etc/module.xml file.
sudo touch  /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/module.xml

sudo echo -e "<?xml version="1.0"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:Module/etc/module.xsd">
    <module name="Mageplaza_HelloWorld" setup_version="1.0.0">
    </module>
</config>
" >>/var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/module.xml


#Step 3: Create etc/registration.php file
sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/registration.php
sudo echo -e "<?php
\Magento\Framework\Component\ComponentRegistrar::register(
    \Magento\Framework\Component\ComponentRegistrar::MODULE,
    'Mageplaza_HelloWorld',
    __DIR__
);
" >>/var/www/html/magento2/app/code/Mageplaza/HelloWorld/registration.php

#Step 4: Enable the module
sudo php /var/www/html/magento2/bin/magento module:status
sudo php /var/www/html/magento2/bin/magento module:enable Mageplaza_HelloWorld
cat  /var/www/html/magento2/app/etc/config.php
sudo php /var/www/html/magento2/bin/magento setup:upgrade
sudo php /var/www/html/magento2/bin/magento setup:static-content:deploy -f

#Create Controller in Magento 2

#Step 1: Create routes.xml file
sudo touch  /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/frontend/routes.xml

sudo echo -e "<?xml version="1.0" ?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:/var/www/html/magento2//var/www/html/magento2/app/etc/routes.xsd">
<router id="standard">
<route frontName="helloworld" id="helloworld">
<module name="Mageplaza_HelloWorld"/>
</route>
</router>
</config>
" >> /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/frontend/routes.xml

#Step 2: Create controller file
sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/Index.php

sudo echo -e "<?php
namespace Mageplaza\HelloWorld\Controller\Index;

class Index extends \Magento\Framework\App\Action\Action
{
    protected $_pageFactory;
    
    public function __construct(
        \Magento\Framework\App\Action\Context $context,
    \Magento\Framework\View\Result\PageFactory $pageFactory)
    {
        $this->_pageFactory = $pageFactory;
        return parent::__construct($context);
    }
    
    public function execute()
    {
        return $this->_pageFactory->create();
    }
}
" >> /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/Index.php

#Step 3: Create controller Layout file
sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/layout/helloworld_index_index.xml
sudo echo -e "<?xml version="1.0"?>
<page xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" layout="1column" xsi:noNamespaceSchemaLocation="urn:magento:framework:View/Layout/etc/page_configuration.xsd">
<referenceContainer name="content">
<block class="Mageplaza\HelloWorld\Block\Index" name="helloworld_index_index" template="Mageplaza_HelloWorld::index.phtml" />
</referenceContainer>
</page>
" >> /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/layout/helloworld_index_index.xml

#Step 4: Create controller Block file
sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Block/Index.php
sudo echo -e "<?php
namespace Mageplaza\HelloWorld\Block;
class Index extends \Magento\Framework\View\Element\Template
{
    
}
" >> /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Block/Index.php
#Step 5: Create controller template file
sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/templates/index.phtml
sudo echo -e "<h2>Welcome to Mageplaza.com</h2>
" >> /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/templates/index.phtml

#Step 6: Flush Magento cache

sudo php /var/www/html/magento2/bin/magento cache:clean
sudo php /var/www/html/magento2/bin/magento cache:flush
sudo php /var/www/html/magento2/bin/magento cache:status
sudo php /var/www/html/magento2/bin/magento setup:di:compile
sudo php /var/www/html/magento2/bin/magento setup:static-content:deploy es_MX en_US -f
sudo chown -R www-data:www-data /var/www/html/magento2/
sudo chmod 777 -R /var/www/html/magento2/

#Step 7: Run a test new controller

