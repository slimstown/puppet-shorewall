define shorewall::managed_file () {
  $dir = "/var/lib/puppet/modules/shorewall/${name}.d"
  concatenated_file { "/var/lib/puppet/modules/shorewall/$name":
          dir => $dir,
    mode => 0600,
  }
  file {
    "${dir}/000-header":
      source => "puppet://$server/shorewall/boilerplate/${name}.header",
      mode => 0600, owner => root, group => 0,
      notify => Exec["concat_${dir}"];
    "${dir}/999-footer":
      source => "puppet://$server/shorewall/boilerplate/${name}.footer",
      mode => 0600, owner => root, group => 0,
      notify => Exec["concat_${dir}"];
  }
}
