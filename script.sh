read -p "Nombre del vendor: " var1
read -p "Nombre del modulo: " var2
read -p "Nombre del frontname: " var3

echo "creando el modulo"
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




sudo sed -i s/Mageplaza/$var1/g "controller/2.control.sh"
sudo sed -i s/HelloWorld/$var2/g "controller/2.control.sh"
sudo sed -i s/Mageplaza/$var1/g "model/3.model.sh"
sudo sed -i s/HelloWorld/$var2/g "model/3.model.sh"
sudo sed -i s/Mageplaza/$var1/g "view/4.view.sh"
sudo sed -i s/HelloWorld/$var2/g "view/4.view.sh"
#cat modulo/1.modulo.sh
#cat controller/2.control.sh
#cat model/3.model.sh
#cat view/4.view.sh
sudo sed -i s/$var1/Mageplaza/g "modulo/1.modulo.sh"
sudo sed -i s/$var2/HelloWorld/g "modulo/1.modulo.sh"
sudo sed -i s/$var1/Mageplaza/g "controller/2.control.sh"
sudo sed -i s/$var2/HelloWorld/g "controller/2.control.sh"
sudo sed -i s/$var1/Mageplaza/g "model/3.model.sh"
sudo sed -i s/$var2/HelloWorld/g "model/3.model.sh"
sudo sed -i s/$var1/Mageplaza/g "view/4.view.sh"
sudo sed -i s/$var2/HelloWorld/g "view/4.view.sh"
#cat modulo/1.modulo.sh
#cat controller/2.control.sh
#cat model/3.model.sh
#cat view/4.view.sh