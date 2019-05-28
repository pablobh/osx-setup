#-------------------------------
# Duplicacy
#-------------------------------
printf "Setting up duplicacy"
mkdir $HOME/Go
mkdir -p $HOME/Go/src/github.com/user
export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
cd ~/
go get -u github.com/gilbertchen/duplicacy/...
cd $GOPATH/src/github.com/gilbertchen/duplicacy
go build duplicacy/duplicacy_main.go