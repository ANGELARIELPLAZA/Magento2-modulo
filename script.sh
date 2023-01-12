read -p "Nombre del vendor: " var1
read -p "Nombre del modulo: " var2
sudo sed -i s/Mageplaza/$var1/g "modulo/1.modulo.sh"
cat modulo/1.modulo.sh
sudo sed -i s/$var1/Mageplaza/g "modulo/1.modulo.sh"
cat modulo/1.modulo.sh

sudo sed -i s/HelloWorld/$var2/g "modulo/1.modulo.sh"
cat modulo/1.modulo.sh
sudo sed -i s/$var2/HelloWorld/g "modulo/1.modulo.sh"
cat modulo/1.modulo.sh