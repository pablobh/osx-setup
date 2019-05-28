#-------------------------------
# Fonts
#-------------------------------
cd ~/Projects
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Operator Mono
git clone https://github.com/Seaony/Operator-Mono.git --depth=1
cd Operator-Mono/src
sudo cp *.otf /Library/Fonts
cd ../..
rm -rf Operator-Mono