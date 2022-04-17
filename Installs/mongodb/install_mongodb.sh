echo "Begin service mongodb instalation"
echo "Installing gnupg..."
sudo apt-get install gnupg
echo "Import the public key used by the package management system..."
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
echo "Creating the /etc/apt/sources.list.d/mongodb-org-5.0.list"
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
echo "Updating the package..."
sudo apt-get update
sudo apt-get install -y mongodb-org