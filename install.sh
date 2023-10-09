sudo apt update

echo "installing squid"

sudo apt install -y squid

echo "add the following settings to your squid proxy configuration file"
echo "http_port 3128"
echo "cache_dir /var/cache/squid 100 16 256"
echo "acl all src 0.0.0.0/0"
echo "http_access allow all"

echo "squid file config created, please put the informations above"
touch squid.conf

echo "after putting config in the squid.conf file, plase put the file in /etc/squid"

echo "installing ngrok"
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar -xzvf https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz

echo "put your access token for ngrok, you can find it as soon you log on https://dashboard.ngrok.com/get-started/setup"
echo "./ngrok config add-authtoken YOUR_AUTH_TOKEN"

echo "sudo service squid start"
echo "./ngrok tcp 3128"



