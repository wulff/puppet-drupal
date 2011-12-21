class iptables {
  file {
    '/etc/iptables.up.rules':
      source => 'puppet:///modules/iptables/iptables.up.rules';
    '/etc/network/if-pre-up.d/iptables':
      source => 'puppet:///modules/iptables/iptables',
      mode => 0755;
  }
}
