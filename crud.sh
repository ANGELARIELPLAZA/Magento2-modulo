# !/bin/bash
# Programa para hacer modulos
sudo mkdir -p /var/wwww/html/magento2/app/code/Mageplaza/HelloWorld/Setup/
sudo mkdir -p /var/wwww/html/magento2/app/code/Mageplaza/HelloWorld/Model/
sudo mkdir -p /var/wwww/html/magento2/app/code/Mageplaza/HelloWorld/Model/ResourceModel/
sudo mkdir -p /var/wwww/html/magento2/app/code/Mageplaza/HelloWorld/Model/ResourceModel/Post/
sudo mkdir -p /var/wwww/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/
#Step 1: Setup Script
sudo touch  /var/wwww/html/magento2/app/code/Mageplaza/HelloWorld/Setup/InstallSchema.php
sudo echo -e "<?php
namespace Mageplaza\HelloWorld\Setup;

class InstallSchema implements \Magento\Framework\Setup\InstallSchemaInterface
{

	public function install(\Magento\Framework\Setup\SchemaSetupInterface $setup, \Magento\Framework\Setup\ModuleContextInterface $context)
	{
		$installer = $setup;
		$installer->startSetup();
		if (!$installer->tableExists('mageplaza_helloworld_post')) {
			$table = $installer->getConnection()->newTable(
				$installer->getTable('mageplaza_helloworld_post')
			)
				->addColumn(
					'post_id',
					\Magento\Framework\DB\Ddl\Table::TYPE_INTEGER,
					null,
					[
						'identity' => true,
						'nullable' => false,
						'primary'  => true,
						'unsigned' => true,
					],
					'Post ID'
				)
				->addColumn(
					'name',
					\Magento\Framework\DB\Ddl\Table::TYPE_TEXT,
					255,
					['nullable => false'],
					'Post Name'
				)
				->addColumn(
					'url_key',
					\Magento\Framework\DB\Ddl\Table::TYPE_TEXT,
					255,
					[],
					'Post URL Key'
				)
				->addColumn(
					'post_content',
					\Magento\Framework\DB\Ddl\Table::TYPE_TEXT,
					'64k',
					[],
					'Post Post Content'
				)
				->addColumn(
					'tags',
					\Magento\Framework\DB\Ddl\Table::TYPE_TEXT,
					255,
					[],
					'Post Tags'
				)
				->addColumn(
					'status',
					\Magento\Framework\DB\Ddl\Table::TYPE_INTEGER,
					1,
					[],
					'Post Status'
				)
				->addColumn(
					'featured_image',
					\Magento\Framework\DB\Ddl\Table::TYPE_TEXT,
					255,
					[],
					'Post Featured Image'
				)
				->addColumn(
						'created_at',
						\Magento\Framework\DB\Ddl\Table::TYPE_TIMESTAMP,
						null,
						['nullable' => false, 'default' => \Magento\Framework\DB\Ddl\Table::TIMESTAMP_INIT],
						'Created At'
				)->addColumn(
					'updated_at',
					\Magento\Framework\DB\Ddl\Table::TYPE_TIMESTAMP,
					null,
					['nullable' => false, 'default' => \Magento\Framework\DB\Ddl\Table::TIMESTAMP_INIT_UPDATE],
					'Updated At')
				->setComment('Post Table');
			$installer->getConnection()->createTable($table);

			$installer->getConnection()->addIndex(
				$installer->getTable('mageplaza_helloworld_post'),
				$setup->getIdxName(
					$installer->getTable('mageplaza_helloworld_post'),
					['name','url_key','post_content','tags','featured_image'],
					\Magento\Framework\DB\Adapter\AdapterInterface::INDEX_TYPE_FULLTEXT
				),
				['name','url_key','post_content','tags','featured_image'],
				\Magento\Framework\DB\Adapter\AdapterInterface::INDEX_TYPE_FULLTEXT
			);
		}
		$installer->endSetup();
	}
}
" >> /var/wwww/html/magento2/app/code/Mageplaza/HelloWorld/Setup/InstallSchema.php

sudo echo -e '<?xml version="1.0"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:Module/etc/module.xsd">
    <module name="Mageplaza_HelloWorld" setup_version="1.1.0">
    </module>
</config>'>>/var/www/html/magento2/app/code/Mageplaza/HelloWorld/etc/module.xml

sudo touch  /var/wwww/html/magento2/app/code/Mageplaza/HelloWorld/Setup/UpgradeSchema.php
sudo echo -e '<?php
namespace Mageplaza\HelloWorld\Setup;

use Magento\Framework\Setup\UpgradeSchemaInterface;
use Magento\Framework\Setup\SchemaSetupInterface;
use Magento\Framework\Setup\ModuleContextInterface;

class UpgradeSchema implements UpgradeSchemaInterface
{
	public function upgrade( SchemaSetupInterface $setup, ModuleContextInterface $context ) {
		$installer = $setup;

		$installer->startSetup();

		if(version_compare($context->getVersion(), '1.1.0', '<')) {
			if (!$installer->tableExists('mageplaza_helloworld_post')) {
				$table = $installer->getConnection()->newTable(
					$installer->getTable('mageplaza_helloworld_post')
				)
					->addColumn(
						'post_id',
						\Magento\Framework\DB\Ddl\Table::TYPE_INTEGER,
						null,
						[
							'identity' => true,
							'nullable' => false,
							'primary'  => true,
							'unsigned' => true,
						],
						'Post ID'
					)
					->addColumn(
						'name',
						\Magento\Framework\DB\Ddl\Table::TYPE_TEXT,
						255,
						['nullable => false'],
						'Post Name'
					)
					->addColumn(
						'url_key',
						\Magento\Framework\DB\Ddl\Table::TYPE_TEXT,
						255,
						[],
						'Post URL Key'
					)
					->addColumn(
						'post_content',
						\Magento\Framework\DB\Ddl\Table::TYPE_TEXT,
						'64k',
						[],
						'Post Post Content'
					)
					->addColumn(
						'tags',
						\Magento\Framework\DB\Ddl\Table::TYPE_TEXT,
						255,
						[],
						'Post Tags'
					)
					->addColumn(
						'status',
						\Magento\Framework\DB\Ddl\Table::TYPE_INTEGER,
						1,
						[],
						'Post Status'
					)
					->addColumn(
						'featured_image',
						\Magento\Framework\DB\Ddl\Table::TYPE_TEXT,
						255,
						[],
						'Post Featured Image'
					)
					->addColumn(
						'created_at',
						\Magento\Framework\DB\Ddl\Table::TYPE_TIMESTAMP,
						null,
						['nullable' => false, 'default' => \Magento\Framework\DB\Ddl\Table::TIMESTAMP_INIT],
						'Created At'
					)->addColumn(
						'updated_at',
						\Magento\Framework\DB\Ddl\Table::TYPE_TIMESTAMP,
						null,
						['nullable' => false, 'default' => \Magento\Framework\DB\Ddl\Table::TIMESTAMP_INIT_UPDATE],
						'Updated At')
					->setComment('Post Table');
				$installer->getConnection()->createTable($table);

				$installer->getConnection()->addIndex(
					$installer->getTable('mageplaza_helloworld_post'),
					$setup->getIdxName(
						$installer->getTable('mageplaza_helloworld_post'),
						['name','url_key','post_content','tags','featured_image'],
						\Magento\Framework\DB\Adapter\AdapterInterface::INDEX_TYPE_FULLTEXT
					),
					['name','url_key','post_content','tags','featured_image'],
					\Magento\Framework\DB\Adapter\AdapterInterface::INDEX_TYPE_FULLTEXT
				);
			}
		}

		$installer->endSetup();
	}
}'>>/var/wwww/html/magento2/app/code/Mageplaza/HelloWorld/Setup/UpgradeSchema.php

sudo php /var/www/html/magento2/bin/magento setup:upgrade
#Step 2: Create Model
sudo mkdir -p /var/wwww/html/magento2/app/code/Mageplaza/HelloWorld/Model/Post.php
sudo echo -e '<?php
namespace Mageplaza\HelloWorld\Model;
class Post extends \Magento\Framework\Model\AbstractModel implements \Magento\Framework\DataObject\IdentityInterface
{
	const CACHE_TAG = 'mageplaza_helloworld_post';

	protected $_cacheTag = 'mageplaza_helloworld_post';

	protected $_eventPrefix = 'mageplaza_helloworld_post';

	protected function _construct()
	{
		$this->_init('Mageplaza\HelloWorld\Model\ResourceModel\Post');
	}

	public function getIdentities()
	{
		return [self::CACHE_TAG . '_' . $this->getId()];
	}

	public function getDefaultValues()
	{
		$values = [];

		return $values;
	}
}'>>/var/wwww/html/magento2/app/code/Mageplaza/HelloWorld/Model/Post.php

#Step 3: Create Resource Model
sudo touch /var/wwww/html/magento2/app/code/Mageplaza/HelloWorld/Model/ResourceModel/Post.php
sudo echo -e '<?php
namespace Mageplaza\HelloWorld\Model\ResourceModel;


class Post extends \Magento\Framework\Model\ResourceModel\Db\AbstractDb
{
	
	public function __construct(
		\Magento\Framework\Model\ResourceModel\Db\Context $context
	)
	{
		parent::__construct($context);
	}
	
	protected function _construct()
	{
		$this->_init('mageplaza_helloworld_post', 'post_id');
	}
	
}'>>/var/wwww/html/magento2/app/code/Mageplaza/HelloWorld/Model/ResourceModel/Post.php

#Step 4: Create Resource Model Collection
sudo touch  /var/wwww/html/magento2/app/code/Mageplaza/HelloWorld/Model/ResourceModel/Post/Collection.php
sudo echo -e '<?php
namespace Mageplaza\HelloWorld\Model\ResourceModel\Post;

class Collection extends \Magento\Framework\Model\ResourceModel\Db\Collection\AbstractCollection
{
	protected $_idFieldName = 'post_id';
	protected $_eventPrefix = 'mageplaza_helloworld_post_collection';
	protected $_eventObject = 'post_collection';

	/**
	 * Define resource model
	 *
	 * @return void
	 */
	protected function _construct()
	{
		$this->_init('Mageplaza\HelloWorld\Model\Post', 'Mageplaza\HelloWorld\Model\ResourceModel\Post');
	}

}
'>>/var/wwww/html/magento2/app/code/Mageplaza/HelloWorld/Model/ResourceModel/Post/Collection.php

#Step 5: Factory Object

sudo touch /var/wwww/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/Index.php
sudo echo -e '<?php
namespace Mageplaza\HelloWorld\Controller\Index;

class Index extends \Magento\Framework\App\Action\Action
{
	protected $_pageFactory;

	protected $_postFactory;

	public function __construct(
		\Magento\Framework\App\Action\Context $context,
		\Magento\Framework\View\Result\PageFactory $pageFactory,
		\Mageplaza\HelloWorld\Model\PostFactory $postFactory
		)
	{
		$this->_pageFactory = $pageFactory;
		$this->_postFactory = $postFactory;
		return parent::__construct($context);
	}

	public function execute()
	{
		$post = $this->_postFactory->create();
		$collection = $post->getCollection();
		foreach($collection as $item){
			echo "<pre>";
			print_r($item->getData());
			echo "</pre>";
		}
		exit();
		return $this->_pageFactory->create();
	}
}'>>/var/wwww/html/magento2/app/code/Mageplaza/HelloWorld/Controller/Index/Index.php



