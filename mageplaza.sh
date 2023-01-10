sudo  mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc
sudo  touch  chmod +x  /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/module.xml

<?xml version="1.0"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:Module/etc/module.xsd">
    <module name="Mageplaza_HelloWorld" setup_version="1.0.0">
    </module>
</config>

sudo touch  chmod +x  /var/www/html/magento2/app/code/Mageplaza/HelloWorld/registration.php

<?php
\Magento\Framework\Component\ComponentRegistrar::register(
	\Magento\Framework\Component\ComponentRegistrar::MODULE,
	'Mageplaza_HelloWorld',
	__DIR__
);

sudo  php  /var/www/html/magento2/bin/magento module:status
sudo  php  /var/www/html/magento2/bin/magento module:enable Mageplaza_HelloWorld
sudo  php /var/www/html/magento2/bin/magento setup:upgrade
sudo  php /var/www/html/magento2/bin/magento setup:static-content:deploy -f

sudo  mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/frontend
sudo  touch  /var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/frontend/routes.xml

<?xml version="1.0" ?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:App/etc/routes.xsd">
    <router id="standard">
        <route frontName="helloworld" id="helloworld">
            <module name="Mageplaza_HelloWorld"/>
        </route>
    </router>
</config>


sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/
sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/Index.php

<?php
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

sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/layout
sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/layout/helloworld_index_index.xml

<?xml version="1.0"?>
<page xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" layout="1column" xsi:noNamespaceSchemaLocation="urn:magento:framework:View/Layout/etc/page_configuration.xsd">
    <referenceContainer name="content">
        <block class="Mageplaza\HelloWorld\Block\Index" name="helloworld_index_index" template="Mageplaza_HelloWorld::index.phtml" />
    </referenceContainer>
</page>

sudo mkdir -p /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Block/
sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/Block/Index.php
<?php
namespace Mageplaza\HelloWorld\Block;
class Index extends \Magento\Framework\View\Element\Template
{

}

sudo touch /var/www/html/magento2/app/code/Mageplaza/HelloWorld/view/frontend/templates/index.phtml

<h2>Welcome to Mageplaza.com</h2>

sudo php /var/www/html/magento2/bin/magento setup:upgrade
sudo php /var/www/html/magento2/bin/magento module:status Mageplaza_HelloWorld
sudo php /var/www/html/magento2/bin/magento c:c
sudo php /var/www/html/magento2/bin/magento c:f
sudo php /var/www/html/magento2/bin/magento setup:di:compile



