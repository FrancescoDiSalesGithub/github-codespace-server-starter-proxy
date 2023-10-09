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


