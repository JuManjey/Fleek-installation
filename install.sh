sudo apt update && sudo apt upgrade -y
sudo apt install screen curl tar wget jq build-essential -y 
sudo apt install make clang pkg-config libssl-dev cmake -y
sudo apt install curl build-essential gcc make -y
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup.sh
sudo sh rustup.sh -y <<< 1
source ~/.profile
source ~/.cargo/env
cargo install sccache
sudo apt-get install protobuf-compiler
protoc --version
cd $HOME 
git clone https://github.com/fleek-network/ursa.git
cd ursa
make install
ursa --version



