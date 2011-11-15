#
# modules/shorewall/manifests/init.pp - manage firewalling with shorewall 3.x
# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# See LICENSE for the full license granted to you.
# 
# Based on the work of ADNET Ghislain <gadnet@aqueos.com> from AQUEOS
# at https://reductivelabs.com/trac/puppet/wiki/AqueosShorewall
#
# Changes:
#  * FHS Layout: put configuration in /var/lib/puppet/modules/shorewall and
#    adjust CONFIG_PATH
#  * remove shorewall- prefix from defines in the shorewall namespace
#  * refactor the whole define structure
#  * manage all shorewall files
#  * add 000-header and 999-footer files for all managed_files
#  * added rule_section define and a few more parameters for rules
#  * add managing for masq, proxyarp, blacklist, nat, rfc1918
#  * add define to manage tunnels
# adapted by immerda project group - admin+puppet(at)immerda.ch
# adapted by Puzzle ITC - haerry+puppet(at)puzzle.ch
#
class shorewall {

    modules_dir { "shorewall": }

    case $operatingsystem {
        gentoo: { include shorewall::gentoo }
        debian: { include shorewall::debian }
        default: { include shorewall::base }
    }

    file {
        	"/var/lib/puppet/modules/shorewall":
        		ensure => directory,
        		force => true,
        		mode => 0755, owner => root, group => 0;
    }


	# See http://www.shorewall.net/3.0/Documentation.htm#Zones
	managed_file{ zones: }

	# See http://www.shorewall.net/3.0/Documentation.htm#Interfaces
	managed_file{ interfaces: }

	# See http://www.shorewall.net/3.0/Documentation.htm#Hosts
	managed_file { hosts: }

	# See http://www.shorewall.net/3.0/Documentation.htm#Policy
	managed_file { policy: }

	# See http://www.shorewall.net/3.0/Documentation.htm#Rules
	managed_file { rules: }
	# mark is new in 3.4.4

	# See http://www.shorewall.net/3.0/Documentation.htm#Masq
	managed_file{ masq: }
	# mark is new in 3.4.4
	# source (= subnet) = Set of hosts that you wish to masquerade.
	# address = If  you  specify  an  address here, SNAT will be used and this will be the source address.

	# See http://www.shorewall.net/3.0/Documentation.htm#ProxyArp
	managed_file { proxyarp: }

	# See http://www.shorewall.net/3.0/Documentation.htm#NAT
	managed_file { nat: }

	# See http://www.shorewall.net/3.0/Documentation.htm#Blacklist
	managed_file { blacklist: }

	# See http://www.shorewall.net/3.0/Documentation.htm#rfc1918
	managed_file { rfc1918: }
	
	# See http://www.shorewall.net/3.0/Documentation.htm#Routestopped
	managed_file { routestopped: }

  # See http://www.shorewall.net/3.0/Documentation.htm#Variables 
  managed_file { params: }

  # See http://www.shorewall.net/3.0/Documentation.htm#Tunnels
  managed_file { tunnels: }

}
