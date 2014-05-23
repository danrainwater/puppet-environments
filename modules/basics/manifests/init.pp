class basics { 

        # comment

        file { "/etc/bashrc":
                content => template('basics/bashrc.erb'),
        }

}
