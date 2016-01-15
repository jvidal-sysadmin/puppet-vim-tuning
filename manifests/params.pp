class vim_tuning::params {
  # Common

  case $::osfamily {
  'Debian': {
    case $::operatingsystem {
      'Debian': {
        $vim_package     = 'vim'
        $user            = 'root'
        $homedir         = "/${user}"
        $plugins_ensure  = 'present'
        $plugins         = ['ctrlpvim/ctrlp.vim', 'scrooloose/nerdtree', 'rodjek/vim-puppet',
                            'scrooloose/syntastic', 'godlygeek/tabular', 'tomtom/tlib_vim',
                            'MarcWeber/vim-addon-mw-utils', 'bling/vim-airline', 'garbas/vim-snipmate',
                            'honza/vim-snippets', 'pld-linux/vim-syntax-vcl', 'sclo/haproxy.vim']
      }
      default: {
      fail("Unsupported platform. Family: ${::osfamily}, OS: ${::operatingsystem}")
      }
    }
  }
  default: {
    fail("Unsupported platform: ${::osfamily}")
  }
  }

}
