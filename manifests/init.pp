# Class: vim_tuning
# ===========================
#
# Install plugins for vim and config vimrc for the system user. By default this class install and configure the perfect plugins combination to develop with Puppet mainly.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'vim_tuning':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Jorge Vidal <jvidal@blackhole.es>
#
# Copyright
# ---------
#
# Copyright 2015 Jorge Vidal.
#
class vim_tuning (
  $user                      = $vim_tuning::params::user,
  $homedir                   = $vim_tuning::params::homedir,
  $plugins_ensure            = $vim_tuning::params::plugins_ensure,
  $plugins                   = undef,
  $default_plugins           = true,
  $default_root_install      = true,
  $vim_package               = $vim_tuning::params::vim_package,
  $manage_vim_package        = true,
  $vimrc_custom_content      = undef,
) inherits vim_tuning::params {

  if $default_plugins == true {
    $plugins_to_install = $vim_tuning::params::plugins
  }
  else {
    $plugins_to_install = $plugins
  }

  # Install vim if not defined or not installed
  if ! defined(Package[$vim_package]) and $manage_vim_package == true {
    package { $vim_package:
      ensure  => present,
    }
  }

  # Install default environment for "root"
  if $default_root_install == true {
    vim_tuning::install { 'root':
      user                      => $user,
      homedir                   => $homedir,
      plugins_ensure            => $plugins_ensure,
      plugins                   => $plugins_to_install,
      vimrc_custom_content      => $vimrc_custom_content,
      extra_configs             => [
        {
          extra_config_title       => "NERD Tree",
          extra_config_description => "https://github.com/scrooloose/nerdtree",
          extra_config_content     => template('vim_tuning/nerdtree_plugin.erb')
        },
        {
          extra_config_title       => "Vim Airline",
          extra_config_description => "https://github.com/bling/vim-airline",
          extra_config_content     => template('vim_tuning/vim-airline_plugin.erb')
        },
        {
          extra_config_title       => "Vim VCL Highlighting",
          extra_config_description => "https://github.com/pld-linux/vim-syntax-vcl",
          extra_config_content     => template('vim_tuning/vim-syntax-vcl_plugin.erb')
        },
        {
          extra_config_title       => "Vim HAProxy Highlighting",
          extra_config_description => "https://github.com/sclo/haproxy.vim",
          extra_config_content     => template('vim_tuning/haproxy.vim_plugin.erb')
        },
      ],
    }

  }

}
