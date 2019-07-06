yum install -y wget &>/dev/null
wget -q https://github.com/shadowsocks/shadowsocks-go/releases/download/1.2.1/shadowsocks-server.tar.gz
tar zxvf shadowsocks-server.tar.gz &> /dev/null
IP=`ip a | grep -Eo 'inet [.0-9]+' | awk '{print $2}' | grep -v 127.0.0.1`
cat <<EOF > config.json
{
    "server": "$IP",
    "server_port": 12288,
    "password":"GreatePwd2",
    "method": "aes-256-cfb",
    "timeout":600
}
EOF
iptables -F
nohup ./shadowsocks-server -c config.json &> /dev/null &
cat config.json
