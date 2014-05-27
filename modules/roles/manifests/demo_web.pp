class roles::demo_web {

        include apache
        include apache::mod::php

        apache::vhost { "demoweb.danrainwater.com":
                port    => '80',
                docroot => '/var/www/html',
        }

        file { "/var/www/html/index.html":
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => '0644',
                content => template('roles/demo_web/index.html.erb'),
        }

        file { "/var/www/html/php_info.php":
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => '0644',
                content => template('roles/demo_web/php_info.php.erb'),
        }

}
