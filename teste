case "$proto" in
    '')
        if [ -z "$proto" -a -z "$port" -a -z "$sport" ]; then
            proto=''
            port=''
            rport=''
            sport=''
            rsport=''
        else
            error "proto must not be empty in ${var}"
            return 1
        fi
        ;;
    _rpc_) # cannot check ports here
        ;;
    tcp|udp)
        if [ -n "$port" ]; then
            rport="--sport $port"
            port="--dport $port"
        else
            port=''
            rport=''
        fi
        if [ -n "$sport" ]; then
            rsport="--dport $sport"
            sport="--sport $sport"
        else
            sport=''
            rsport=''
        fi

        ;;
    icmp)
        if [ -n "$port" ]; then
            port="--icmp-type $port"
            rport="$port"
        else
            port=''
            rport=''
        fi
        if [ -n "$sport" ]; then
            sport="--icmp-type $sport"
            rsport="$sport"
        else
            sport=''
            rsport=''
        fi
    *)
        if [ -n "$port" ]; then
            error "port is only valid with tcp, udp or icmp in ${var}"
            return 1
        fi
    ;;
esac
