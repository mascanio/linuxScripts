eclipse=$1
eclipseName=$2
installPath=/opt/eclipse

sudo mkdir $installPath

# Extaer
mv $eclipse /tmp
cd /tmp

tar -xf $eclipse
mv eclipse $eclipseName
echo Extraccion completada

# Mover a opt
sudo mv $eclipseName $installPath
echo Copiado a $installPath

# Crear enlaces
sudo ln -s /opt/eclipse/$eclipseName/eclipse /bin/$eclipseName

