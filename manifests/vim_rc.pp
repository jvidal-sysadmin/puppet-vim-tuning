define vim_tuning::vim_rc (
  $user                  = $vim_tuning::params::user,
  $homedir               = $vim_tuning::params::homedir,
  $plugins               = $vim_tuning::params::plugins,
  $vimrc_custom_content  = undef,
) {

  concat { "${homedir}/.vimrc" :
    ensure => present,
    owner  => $user,
  }

  concat::fragment { "${user}_vimrc_default_fragment":
    target  => "${homedir}/.vimrc",
    content => template('vim_tuning/vimrc_default.erb'),
    order   => '01',
  }

  if $vimrc_custom_content != undef {
    concat::fragment { "${user}_vimrc_custom_header_fragment":
      target  => "${homedir}/.vimrc",
      content => template('vim_tuning/vimrc_custom_header.erb'),
      order   => '03',
    }
    concat::fragment { "${user}_vimrc_custom_content_fragment":
      target  => "${homedir}/.vimrc",
      content => $vimrc_custom_content,
      order   => '04',
    }
  }

}
