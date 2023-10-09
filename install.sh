sudo apt update

echo "installing squid"

sudo apt install -y squid

echo "add the following settings to your squid proxy configuration file " 
echo "http_port 3128 " > squid.conf
echo "cache_dir /var/cache/squid 100 16 256 " >> squid.conf
echo "acl all src 0.0.0.0/0 " >> squid.conf
echo "http_access allow all " >> squid.conf

echo "after putting config in the squid.conf file, plase put the file in /etc/squid"
sudo cp squid.conf /etc/squid/

echo "starting squid proxy"
sudo service squid start

echo "installing ngrok"
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz

echo "extracting ngrok"
tar -xzvf ngrok-v3-stable-linux-amd64.tgz

echo "adding auth token"

if [ $1 == "" ]
then
    echo "please pass as argument your ngrok auth token"
else
    ./ngrok config add-authtoken 2NFDA7FBMluRcJwxFwnaOnq9SPX_5ymqWhtnu1sAoEn4Y9sP
    echo "auth token saved"
fi

echo "starting ngrok"
./ngrok tcp 3128


