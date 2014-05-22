class firstmodule(
        $data_mount     = '/data01',
        $key1           = 'default_key1_value',
        $key2           = 'default_key2_value',
        $key3           = 'default_key3_value',
) {

        file { "${data_mount}":
                ensure => directory,
                owner  => root,
                group  => root,
                mode   => '0755',
        }

        file { "${data_mount}/first_directory":
                ensure => directory,
                owner  => root,
                group  => root,
                mode   => '0755',
        }

        file { "${data_mount}/first_directory/first_file":
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => '0644',
                content => template('firstmodule/first_file.erb'),
                require => File["${data_mount}/first_directory"],
        }

        #notify { "key1: ${key1}": }
        #notify { "key2: ${key2}": }
        #notify { "key3: ${key3}": }
}
