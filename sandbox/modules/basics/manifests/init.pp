class basics { 

        file { "/etc/bashrc":
                content => template('basics/bashrc.erb'),
        }

}
