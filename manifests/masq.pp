define shorewall::masq($interface, $source, $address = '-', $proto = '-', $port = '-', $ipsec = '-', $mark = '', $order='100' ) {
  shorewall::entry { "masq.d/${order}-${name}":
    line => "# ${name}\n${interface} ${source} ${address} ${proto} ${port} ${ipsec} ${mark}"
  }
}
