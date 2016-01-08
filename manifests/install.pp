define vim_tuning::install (
  $user                 = undef,
  $homedir              = undef,
  $plugins_ensure       = $vim_tuning::params::plugins_ensure,
  $plugins              = undef,
  $vimrc_custom_content = undef,
  $extra_configs        = undef,
) {

  # TODO: Para dejarlo fino del todo, habria que crear una variable mas llamada extra config, que fuera
  # un hash y que llamara al DEFINED de extra_config para poder usar este DEFINED para todo y no usar los DEFINED privados :D
  
  if $user == undef or $homedir == undef {
    fail('Variables $user and $homedir are required.')
  }


  vim_tuning::vim_pathogen { "${user}_pathogen":
    user           => $user,
    homedir        => $homedir,
    plugins_ensure => $plugins_ensure,
  }

  if $plugins != undef {
    vim_tuning::vim_plugins { "${user}_plugins":
      user           => $user,
      homedir        => $homedir,
      plugins        => $plugins,
      plugins_ensure => $plugins_ensure,
    }
  }

  vim_tuning::vim_rc { "${user}_vimrc_custom_content":
    user                 => $user,
    homedir              => $homedir,
    plugins              => $plugins,
    vimrc_custom_content => $vimrc_custom_content,
  }

  
  if $extra_configs {
    if !is_hash($extra_configs) and !(is_array($extra_configs) and is_hash($extra_configs[0])) {
      fail("Vim_tuning::Install[${user}]: 'extra_configs' must be either a Hash or an Array of Hashes")
    } else {
      $extra_configs.each |Hash $extra_config| {
        $_extra_config = $extra_config['extra_config_name']
        if $extra_config['extra_config_content'] != undef {
          $_extra_config_content = $extra_config['extra_config_content']
        } else {
          $_extra_config_content = undef
        }

        vim_tuning::vim_rc::extra_config { "${user}_${_extra_config}_extra_config":
          user                 => $user,
          homedir              => $homedir,
          extra_config_content => $_extra_config_content,
        }
      }
    }
  }

}
