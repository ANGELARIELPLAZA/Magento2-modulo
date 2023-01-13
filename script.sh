read -p "Nombre del vendor: " var1
read -p "Nombre del vendor:(minuscula) " var1minuscula
read -p "Nombre del modulo: " var2
read -p "Nombre del modulo (minuscula): " var2minuscula
read -p "Nombre del frontname  (minuscula) : " var3

echo "***************Editando el modulo***************"
sudo sed -i s/Mageplaza/$var1/g "modulo/1.modulo.sh"
sudo sed -i s/HelloWorld/$var2/g "modulo/1.modulo.sh"
echo "editando el module.xml"
sudo sed -i s/Mageplaza/$var1/g "modulo/module.xml"
sudo sed -i s/HelloWorld/$var2/g "modulo/module.xml"
echo "editando el registration.php"
sudo sed -i s/Mageplaza/$var1/g "modulo/registration.php"
sudo sed -i s/HelloWorld/$var2/g "modulo/registration.php"
echo "editando el routes.xml"
sudo sed -i s/Mageplaza/$var1/g "modulo/routes.xml"
sudo sed -i s/HelloWorld/$var2/g "modulo/routes.xml"
sudo sed -i s/helloworld/$var3/g "modulo/routes.xml"
echo "editando el Test.php"
sudo sed -i s/Mageplaza/$var1/g "modulo/Test.php"
sudo sed -i s/HelloWorld/$var2/g "modulo/Test.php"
echo "***************Editando el controller***************"
echo "cambiando el nombre y editando  helloworld_index_index.xml"
sudo sed -i s/Mageplaza/$var1/g "controller/helloworld_index_index.xml"
sudo sed -i s/HelloWorld/$var2/g "controller/helloworld_index_index.xml"
sudo sed -i s/mageplaza/$var1minuscula/g "controller/helloworld_index_index.xml"
sudo sed -i s/helloworld/$var2minuscula/g "controller/helloworld_index_index.xml"
nombre="_index_index.xml"
index="$var3$nombre"
echo $index
cd controller
sudo mv   helloworld_index_index.xml $index
cd ..
sudo sed -i s/Mageplaza/$var1/g "controller/2.control.sh"
sudo sed -i s/HelloWorld/$var2/g "controller/2.control.sh"
sudo sed -i s/mageplaza/$var1minuscula/g "controller/2.control.sh"
sudo sed -i s/helloworld/$var2minuscula/g "controller/2.control.sh"
echo "editando el routes.xml"
sudo sed -i s/Mageplaza/$var1/g "controller/routes.xml"
sudo sed -i s/HelloWorld/$var2/g "controller/routes.xml"
sudo sed -i s/helloworld/$var3/g "controller/routes.xml"
echo "editando el Index.php"
sudo sed -i s/Mageplaza/$var1/g "controller/Index.php"
sudo sed -i s/HelloWorld/$var2/g "controller/Index.php"
echo "editando el Block/Index.php"
sudo sed -i s/Mageplaza/$var1/g "controller/block/Index.php"
sudo sed -i s/HelloWorld/$var2/g "controller/block/Index.php"
echo "editando el templates/index.phtml"
sudo sed -i s/Mageplaza/$var1/g "controller/index.phtml"
sudo sed -i s/HelloWorld/$var2/g "controller/index.phtml"
echo "***************Editando el model***************"
sudo sed -i s/Mageplaza/$var1/g "model/3.model.sh"
sudo sed -i s/HelloWorld/$var2/g "model/3.model.sh"
echo "editando Setup/InstallSchema.php"
sudo sed -i s/Mageplaza/$var1/g "model/InstallSchema.php"
sudo sed -i s/HelloWorld/$var2/g "model/InstallSchema.php"
sudo sed -i s/mageplaza/$var1minuscula/g "model/InstallSchema.php"
sudo sed -i s/helloworld/$var2minuscula/g "model/InstallSchema.php"
echo "editando etc/module.xml"
sudo sed -i s/Mageplaza/$var1/g "model/module.xml"
sudo sed -i s/HelloWorld/$var2/g "model/module.xml"
echo "editando UpgradeSchema.php"
sudo sed -i s/Mageplaza/$var1/g "model/UpgradeSchema.php"
sudo sed -i s/HelloWorld/$var2/g "model/UpgradeSchema.php"
sudo sed -i s/mageplaza/$var1minuscula/g "model/UpgradeSchema.php"
sudo sed -i s/helloworld/$var2minuscula/g "model/UpgradeSchema.php"
echo "editando InstallData.php"
sudo sed -i s/Mageplaza/$var1/g "model/InstallData.php"
sudo sed -i s/HelloWorld/$var2/g "model/InstallData.php"
echo "editando UpgradeData.php"
sudo sed -i s/Mageplaza/$var1/g "model/UpgradeData.php"
sudo sed -i s/HelloWorld/$var2/g "model/UpgradeData.php"
sudo sed -i s/mageplaza/$var1minuscula/g "model/UpgradeData.php"
sudo sed -i s/helloworld/$var2minuscula/g "model/UpgradeData.php"
echo "editando Model/Post.php"
sudo sed -i s/Mageplaza/$var1/g "model/Post.php"
sudo sed -i s/HelloWorld/$var2/g "model/Post.php"
sudo sed -i s/mageplaza/$var1minuscula/g "model/Post.php"
sudo sed -i s/helloworld/$var2minuscula/g "model/Post.php"
echo "editando ResourceModel/Post.php"
sudo sed -i s/Mageplaza/$var1/g "model/ResourceModel/Post.php"
sudo sed -i s/HelloWorld/$var2/g "model/ResourceModel/Post.php"
sudo sed -i s/mageplaza/$var1minuscula/g "model/ResourceModel/Post.php"
sudo sed -i s/helloworld/$var2minuscula/g "model/ResourceModel/Post.php"
echo "editando Post/Collection.php"
sudo sed -i s/Mageplaza/$var1/g "model/Collection.php"
sudo sed -i s/HelloWorld/$var2/g "model/Collection.php"
sudo sed -i s/mageplaza/$var1minuscula/g "model/Collection.php"
sudo sed -i s/helloworld/$var2minuscula/g "model/Collection.php"
echo "editando Index/Index.php"
sudo sed -i s/Mageplaza/$var1/g "model/Index.php"
sudo sed -i s/HelloWorld/$var2/g "model/Index.php"
echo "***************Editando el VIEW***************"
echo "cambiando el nombre y editando el layout/helloworld_index_display.xml"
sudo sed -i s/Mageplaza/$var1/g "view/helloworld_index_display.xml"
sudo sed -i s/HelloWorld/$var2/g "view/helloworld_index_display.xml"
sudo sed -i s/mageplaza/$var1minuscula/g "view/helloworld_index_display.xml"
sudo sed -i s/helloworld/$var2minuscula/g "view/helloworld_index_display.xml"
nombre="_index_display.xml"
index="$var3$nombre"
echo $index
cd view
sudo mv   helloworld_index_display.xml $index
cd ..
sudo sed -i s/Mageplaza/$var1/g "view/4.view.sh"
sudo sed -i s/HelloWorld/$var2/g "view/4.view.sh"
echo "editando Index/Display.php"
sudo sed -i s/Mageplaza/$var1/g "view/Display.php"
sudo sed -i s/HelloWorld/$var2/g "view/Display.php"
echo "editando Block/Display.php"
sudo sed -i s/Mageplaza/$var1/g "view/Block/Display.php"
sudo sed -i s/HelloWorld/$var2/g "view/Block/Display.php"
echo "editando templates/sayhello.phtml"
sudo sed -i s/Mageplaza/$var1/g "view/sayhello.phtml"
sudo sed -i s/HelloWorld/$var2/g "view/sayhello.phtml"


echo "Ejecutando el modulo"
cd modulo 
sudo sh 1.modulo.sh
cd ..
echo "http://192.168.0.37/$var2/index/test"
echo "Ejecutando el controller"
cd controller 
sudo sh 2.control.sh
cd ..
echo "Ejecutando el model"
cd model 
sudo sh 3.model.sh
cd ..
echo "Ejecutando el view"
cd view 
sudo sh 4.view.sh
cd ..
#sudo sed -i s/$var1/Mageplaza/g "modulo/1.modulo.sh"
#sudo sed -i s/$var2/HelloWorld/g "modulo/1.modulo.sh"
#sudo sed -i s/$var1/Mageplaza/g "controller/2.control.sh"
#sudo sed -i s/$var2/HelloWorld/g "controller/2.control.sh"
#sudo sed -i s/$var1/Mageplaza/g "model/3.model.sh"
#sudo sed -i s/$var2/HelloWorld/g "model/3.model.sh"
#sudo sed -i s/$var1/Mageplaza/g "view/4.view.sh"
#sudo sed -i s/$var2/HelloWorld/g "view/4.view.sh"

