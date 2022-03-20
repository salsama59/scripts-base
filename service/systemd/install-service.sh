fullFilePath=$1
fileNameWithExtension="${fullFilePath##*/}"
fileNameWithoutExtension="${fileNameWithExtension%.*}"
echo "Begin service $fileNameWithExtension instalation"

serviceScriptFullPath="/etc/systemd/system/${fileNameWithoutExtension}.service"
echo "creating the service script : ${serviceScriptFullPath} ..."
sudo touch "${serviceScriptFullPath}"

executionScript="java -jar $2 ${fullFilePath}"
echo "Populating the service script file : ${serviceScriptFullPath} ..."
echo "The following launch script will be played to start the service : $executionScript"
echo "[Unit]
Description=$fileNameWithoutExtension service
After=syslog.target

[Service]
User=ubuntu
ExecStart=$executionScript
SuccessExitStatus=143

[Install]
WantedBy=multi-user.target" >> $serviceScriptFullPath
