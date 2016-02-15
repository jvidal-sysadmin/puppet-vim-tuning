define vim_tuning::vim_rc::extra_config (
  $user                      = $vim_tuning::params::user,
  $homedir                   = $vim_tuning::params::homedir,
  $extra_config_title        = undef,
  $extra_config_description  = undef,
  $extra_config_content      = undef,
) {

  if $extra_config_title == undef {
    fail('Variable "extra_config_content" is not be UNDEF or EMPTY')
  }
  else {
    # Sorry but I hate spaces!
    $extra_config_title_no_space = regsubst($extra_config_title, ' ', '_', 'G')
    $content_header = template('vim_tuning/vimrc_extra_config_header.erb')
    $content = "${content_header}${extra_config_content}\n\n"
  }

  concat::fragment { "${user}_vimrc_${extra_config_title_no_space}_fragment":
    target  => "${homedir}/.vimrc",
    content => $content,
    order   => '02',
  }
}
