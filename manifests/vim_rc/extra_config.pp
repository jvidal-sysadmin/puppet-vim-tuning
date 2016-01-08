define vim_tuning::vim_rc::extra_config (
  $user                  = $vim_tuning::params::user,
  $homedir               = $vim_tuning::params::homedir,
  $extra_config_name     = $title,
  $extra_config_content  = undef,
) {

  if $extra_config_content == undef {
    $content = template("vim_tuning/${extra_config_name}_plugin.erb")
  }
  else {
    $content_header = template('vim_tuning/vimrc_extra_config_header.erb')
    $content = "${content_header}${extra_config_content}\n\n\n"
  }

  concat::fragment { "${user}_vimrc_${extra_config_name}_fragment":
    target  => "${homedir}/.vimrc",
    content => $content,
    order   => '02',
  }
}
