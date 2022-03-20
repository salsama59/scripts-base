fullFilePath=$1
fileNameWithExtension="${fullFilePath##*/}"
fileNameWithoutExtension="${fileNameWithExtension%.*}"
echo "Begin service $fileNameWithExtension instalation"

serviceScriptFullPath="/etc/systemd/system/${fileNameWithoutExtension}.service"
echo "creating the service script : ${serviceScriptFullPath} ..."
sudo touch "${serviceScriptFullPath}"

echo "Populating the service script file : ${serviceScriptFullPath} ..."
echo "[Unit]
Description=$fileNameWithoutExtension service
After=syslog.target

[Service]
User=ubuntu
ExecStart=$fullFilePath
SuccessExitStatus=143

[Install]
WantedBy=multi-user.target" >> $serviceScriptFullPath
