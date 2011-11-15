define shorewall::tunnel($type, $zone, $gateway, $gatewayzone = '', $order='100'){
    shorewall::entry { "tunnels.d/${order}-${name}":
        #TYPE           ZONE          GATEWAY          GATEWAY ZONE
        line => "${type} ${zone} ${gateway} ${gatewayzone}",
    }
}
