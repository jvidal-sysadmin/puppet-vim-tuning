define vim_tuning::vim_plugins (
  $user           = $vim_tuning::params::user,
  $homedir        = $vim_tuning::params::homedir,
  $plugins_ensure = $vim_tuning::params::plugins_ensure,
  $plugins        = $vim_tuning::params::plugins,
) {

  # Download each repository from "plugins" in array format into "bundle" dir
  $plugins.each |String $plugin| {
    $reponame = regsubst($plugin,'.*/(.*)','\1')
    vcsrepo { "${user}_${plugin}":
      ensure   => $plugins_ensure,
      provider => git,
      source   => "https://github.com/${plugin}.git",
      path     => "${homedir}/.vim/bundle/${reponame}",
      user     => $user,
    }
  }
}
