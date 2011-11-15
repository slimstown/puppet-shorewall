define shorewall::rule($action, $source, $destination, $proto = '-',
  $destinationport = '-', $sourceport = '-', $originaldest = '-',
  $ratelimit = '-', $user = '-', $mark = '', $order)
{
  shorewall::entry { "rules.d/${order}-${name}":
    line => "# ${name}\n${action} ${source} ${destination} ${proto} ${destinationport} ${sourceport} ${originaldest} ${ratelimit} ${user} ${mark}",
  }
}
