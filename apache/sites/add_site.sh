echo "Begin site configuration :"
read -p "Please enter the site port: " port
read -p "Please enter the site directory: " siteDirectory
read -p "Please enter the site server name eg www.my-site-name.com: " siteServerName
read -p "Please enter the site configuration file name: " siteConfigurationFileName

configurationFilePath="/etc/apache2/sites-available/$siteConfigurationFileName.conf"

echo "Calculated configuration file path is : $configurationFilePath"

echo "Creating configuration file $siteConfigurationFileName.conf"
sudo cat ./site_configuration_template/apache_site_template.conf > $configurationFilePath

sudo chmod 644 $configurationFilePath

echo "Attempting to replace {PORT_VALUE} by $port ..."
sudo sed -i "s/{PORT_VALUE}/$port/" $configurationFilePath
echo "Attempting to replace {SITE_DIRECTORY} by $siteDirectory ..."
sudo sed -i "s@{SITE_DIRECTORY}@$siteDirectory@" $configurationFilePath
echo "Attempting to replace {SITE_SERVER_NAME} by $siteServerName ..."
sudo sed -i "s/{SITE_SERVER_NAME}/$siteServerName/" $configurationFilePath

echo "Enabling the $siteConfigurationFileName site ..."
sudo a2ensite "$siteConfigurationFileName.conf"

echo "Do not forget to add the new port inside /etc/apache2/ports.conf eg Listen 8081 !!!!!!!!!!"