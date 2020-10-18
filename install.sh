apt-get update && apt-get -y upgrade
apt-get install -y build-essential

#step1
wget --no-check-certificate https://github.com/z3APA3A/3proxy/archive/0.8.13.tar.gz
tar xzf 0.8.13.tar.gz
echo "step1 done"

#step2
cd 3proxy-0.8.13
make -f Makefile.Linux
echo "step2 done"

#step3
cd src
mkdir /etc/3proxy/
sudo mv 3proxy /etc/3proxy/
echo "step3 done"

#step4
cd /etc/3proxy/
sudo wget --no-check-certificate https://raw.githubusercontent.com/pagekeith878/p3/main/3proxy.cfg
chmod 600 /etc/3proxy/3proxy.cfg
echo "step4 done"

#step5
sudo echo "username:CL:va3kjg9gtc5DFnphgWJFog5TB6vCo" > .proxyauth
chmod 600 /etc/3proxy/.proxyauth
echo "step5 done"

#step6
cd /etc/init.d/
wget --no-check-certificate https://raw.githubusercontent.com/pagekeith878/p3/main/3proxyinit
chmod  +x /etc/init.d/3proxyinit
echo "step6 done"

#step7
update-rc.d 3proxyinit defaults
sudo /etc/init.d/3proxyinit start
echo "step7 done"
