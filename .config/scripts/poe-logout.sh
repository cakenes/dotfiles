/home/used/.config/scripts/iptables -I INPUT -p tcp --sport 6112 --tcp-flags PSH,ACK PSH,ACK -j REJECT --reject-with tcp-reset
sleep 1
/home/used/.config/scripts/iptables -D INPUT -p tcp --sport 6112 --tcp-flags PSH,ACK PSH,ACK -j REJECT --reject-with tcp-reset
