class puppet::agent(
        $puppet_server  = "${puppet_server}"
){

        if(empty($puppet_server)) {
                fail('puppet_server must not be empty')
        }
        
        file { "/etc/puppetlabs/puppet/puppet.conf":
                ensure  => file,
                owner   => 'pe-puppet',
                group   => 'pe-puppet',
                mode    => '0644',
                content => template('puppet/puppet.conf.erb'),
                notify  => Service['pe-puppet'],
        }

}
