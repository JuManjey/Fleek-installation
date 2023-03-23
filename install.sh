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
##!! ERROR ссылется на функцию delete, которой нет (delete from db)
ursa --version
screen -S fleek -X stuff "cd $HOME/ursa\n"
screen -S fleek -X stuff "./ursa\n"
curl https://ipfs.io/ipfs/bafybeidqdywrzg7c3b4dmm332m4b7uiakgitplz2pep2zntederxpj3odi -o basic.car
ursa rpc put basic.car
Теперь попробуем получить наш файл из сети
ursa rpc get bafybeifyjj2bjhtxmp235vlfeeiy7sz6rzyx3lervfk3ap2nyn4rggqgei ./output
При успешном выполнении команды мы получим файл с названием CID (идентификатор содержимого файла) и расширением .car
bafybeifyjj2bjhtxmp235vlfeeiy7sz6rzyx3lervfk3ap2nyn4rggqgei.car
Содержимое представляет собой двоичную строку, которую может понять только интерпретатор. Тем не менее, мы можем подтвердить размер файла, выполнив простую команду list для проверки файлов, полученных из сети
ls -hl ./output
Обратите внимание, что это тот же размер файла, что и исходный файл basic.car, который мы загрузили в сеть. Также можно проверить файлы спомощью утилиты cmp
cmp basic.car bafybeifyjj2bjhtxmp235vlfeeiy7sz6rzyx3lervfk3ap2nyn4rggqgei.car
