define shorewall::host($zone, $options = 'tcpflags,blacklist,norfc1918',$order='100',$host='') {
  
  if $host {
    $line = "${zone} ${host} ${options}"
  } else {
    $line = "${zone} ${name} ${options}"
  }

  shorewall::entry { "hosts.d/${order}-${name}":
    line => $line,
  }
}
