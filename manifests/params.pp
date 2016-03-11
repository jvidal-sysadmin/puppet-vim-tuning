class vim_tuning::params {
  case $::osfamily {
    'Debian': {
      $vim_package = 'vim'
    }
    'RedHat': {
      $vim_package = 'vim-enhanced'
    }
    'Suse': {
      $vim_package = 'vim'
    }
    default: {
      fail("Unsupported platform: ${::osfamily}")
    }
  }

  # Common
  $user            = 'root'
  $homedir         = "/${user}"
  $plugins_ensure  = 'present'
  $plugins         = ['ctrlpvim/ctrlp.vim', 'scrooloose/nerdtree', 'voxpupuli/vim-puppet',
                      'scrooloose/syntastic', 'godlygeek/tabular', 'tomtom/tlib_vim',
                      'MarcWeber/vim-addon-mw-utils', 'vim-airline/vim-airline', 'vim-airline/vim-airline-themes',
                      'garbas/vim-snipmate', 'honza/vim-snippets', 'pld-linux/vim-syntax-vcl', 'sclo/haproxy.vim']

}
