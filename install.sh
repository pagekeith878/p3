apt-get update && apt-get -y upgrade
apt-get install -y build-essential

wget --no-check-certificate https://github.com/z3APA3A/3proxy/archive/0.8.13.tar.gz
tar xzf 3proxy-0.8.13.tar.gz

cd 3proxy-0.8.13
make -f Makefile.Linux

#src
cd src
mkdir /etc/3proxy/
mv 3proxy /etc/3proxy/

cd /etc/3proxy/
wget --no-check-certificate https://raw.githubusercontent.com/pagekeith878/3p/main/3proxy.cfg
chmod 600 /etc/3proxy/3proxy.cfg

echo "username:CL:va3kjg9gtc5DFnphgWJFog5TB6vCo" > .proxyauth
chmod 600 /etc/3proxy/.proxyauth

cd /etc/init.d/
wget --no-check-certificate https://raw.githubusercontent.com/pagekeith878/3p/main/3proxyinit
chmod  +x /etc/init.d/3proxyinit

update-rc.d 3proxyinit defaults

sudo /etc/init.d/3proxyinit start
