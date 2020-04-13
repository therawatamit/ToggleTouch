# Confirm Install
while true; do
    read -p "Do you wish to install ToggleTouchBETA? (y/n)        " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo "Quiting ToggleTouchBETA installer."; exit;;
        * ) echo "  invalid input";;
    esac
done

mkdir ~/.toggletouch
mv ~/ToggleTouch.sh ~/.toggletouch/ToggleTouch.sh
chmod +x ~/.toggletouch/ToggleTouch.sh
echo "Root permission required for completing installation."
sudo cp ~/.toggletouch/ToggleTouch.sh /usr/bin/toggletouch
sudo chmod +x /usr/bin/toggletouch
mv ~/install-toggletouch.sh ~/.toggletouch/install-archived.sh
sleep 1
echo "ToggleTouchBETA installation successful."
echo "Please use the terminal command 'toggletouch' to toggle your touchscreen on and off"
