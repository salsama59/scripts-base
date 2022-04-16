
echo "Begin site configuration :"
read -p "Please enter the site port: " port
read -p "Please enter the site directory: " siteDirectory
read -p "Please enter the site server name eg www.my-site-name.com: " siteServerName
read -p "Please enter the site configuration file name: " siteConfigurationFileName

configurationFilePath = "/etc/apache/sites-available/$siteConfigurationFileName.conf"

echo "Calculated configuration file path is : $configurationFilePath"

echo "Creating configuration file $siteConfigurationFileName.conf"
cat ./site_configuration_template/apache_site_template.conf > $configurationFilePath

echo "Attempting to replace {PORT_VALUE} by $port ..."
sed -i "s/{PORT_VALUE}/$port/" $configurationFilePath
echo "Attempting to replace {SITE_DIRECTORY} by $siteDirectory ..."
sed -i "s/{SITE_DIRECTORY}/$siteDirectory/" $configurationFilePath
echo "Attempting to replace {SITE_SERVER_NAME} by $siteServerName ..."
sed -i "s/{SITE_SERVER_NAME}/$siteServerName/" $configurationFilePath


echo "Enabling the site ..."
a2ensite $configurationFilePath