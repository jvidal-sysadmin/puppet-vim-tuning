define vim_tuning::vim_pathogen (
  $user           = $vim_tuning::params::user,
  $homedir        = $vim_tuning::params::homedir,
  $plugins_ensure = $vim_tuning::params::plugins_ensure,
) {
  # Downloading pathogen git repository
  vcsrepo { "${user}_vim-pathogen":
    ensure   => $plugins_ensure,
    provider => git,
    source   => 'https://github.com/tpope/vim-pathogen.git',
    path     => "${homedir}/.vim/vim-pathogen",
    user     => $user,
  }

  # Creating "autoload" symboliclink to enable pathogen (More details: https://github.com/tpope/vim-pathogen)
  file { "${homedir}/.vim/autoload" :
    ensure  => link,
    owner   => $user,
    target  => "${homedir}/.vim/vim-pathogen/autoload",
    require => Vcsrepo["${homedir}/.vim/vim-pathogen"],
  }
}
