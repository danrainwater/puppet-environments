class puppet::agent(
        $puppet_server  = "${puppet_server}"
){

        include puppet::agent::service

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
        
        file { '/opt/puppet/lib/ruby/site_ruby/1.9.1/facter/ec2.rb':
                ensure  => 'file',
                owner   => 'root',
                group   => 'root',
                mode    => '0644',
                content => template('puppet/ec2.rb.erb'),
        }

}
