# vim_tuning

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with vim_tuning](#setup)
    - [Beginning with vim_tuning](#beginning-with-vim_tuning)
3. [Usage - Configuration options and additional functionality](#usage)
    - [Configuring with custom plugins](#configuring-with-custom-plugins)
    - [Adding custom arbitrary configurations](#adding-custom-arbitrary-configurations)
    - [Adding several structural configurations](#adding-several-structural-configurations)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
    - [Public classes](#public-classes)
    - [Private classes](#private-classes)
    - [Public defined types](#public-defined-types)
    - [Private defined types](#private-defined-types)
    - [Templates](#templates)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This [Puppet module](https://docs.puppetlabs.com/puppet/latest/reference/modules_fundamentals.html) simplifies the [vim](http://www.vim.org/) personalisation (.vimrc file) by a clean and orderly way. In addition to install and maintain [pathogen](https://github.com/tpope/vim-pathogen) and `vim` package, `vim-tuning` also is responsible for installing and updating GitHub third-party plugins such as [vim-puppet](https://github.com/rodjek/vim-puppet), [syntastic](https://github.com/scrooloose/syntastic) or [vim-airline](https://github.com/vim-airline/vim-airline).

Basically, we can customize each system user with different combinations of configurations and plugins. We can also reuse those configurations and create new ones in a cleaner way.

## Setup

**What the vim-tuning Puppet module affects:**

- Configuration files and directories (created and written to).
- Package/configuration files for Vim.
- GitHub repositories.

### Beginning with vim_tuning

To have Puppet configure vim with the default parameters for **root** user, just declare the `vim_tuning` class:

``` puppet
class { 'vim_tuning': }
```

The Puppet module applies a default configuration. These defaults works well in Puppet develoment environments but you can customize the class's parameters to suit your preferences. 

You can customize parameters when declaring the `vim_tuning` class. For instance, this declaration installs `vim` without vim plugins, allowing you to customize all configurations and plugins:

``` puppet
class { 'vim_tuning':
  default_root_install => false,
}
```
## Usage

The default [`vim_tuning`](#class-vim_tuning) class manage vim package and sets up root user with optimize settings and the best known plugins.

To configure another system user you must use `vim_tuning::install`defined type.

> **Note**: See the [`vim_tuning::install`](#defined-type-vim_tuninginstall) defined type's reference for a list of all virtual host parameters.

To configure default vim environment to some system user just set two next mandatory parameters:

``` puppet
vim_tuning::install { 'username1':
    user    => 'username1',
    homedir => '/home/username1',
}
```

### Configuring with custom plugins

Just overwride `plugins` parameter. Note the name of plugins is built by `'githubuser/reponame'`:

``` puppet
vim_tuning::install { 'username1':
    user    => 'username1',
    homedir => '/home/username1',
    plugins => ['pld-linux/vim-syntax-vcl', 'rodjek/vim-puppet'],
}
```
> **Note**: Only github repositories are supported actually.

### Adding custom arbitrary configurations

Sometimes we just want to add some lines:

``` puppet
vim_tuning::install { 'username1':
    user                 => 'username1',
    homedir              => '/home/username1',
    plugins              => ['pld-linux/vim-syntax-vcl', 'rodjek/vim-puppet'],
    vimrc_custom_content => 'set backgound=dark',
}
```

Files and templates are supported.

### Adding several structural configurations

This is useful to keep order and to combine configurations between multiple users using shared files/templates:

``` puppet
vim_tuning::install { 'username1':
    user                 => 'username1',
    homedir              => '/home/username1',
    plugins              => ['pld-linux/vim-syntax-vcl', 'rodjek/vim-puppet'],
    vimrc_custom_content => 'set backgound=dark',
    extra_configs        => [
      {
        extra_config_title       => 'Vim VCL Highlighting',
        extra_config_description => 'https://github.com/pld-linux/vim-syntax-vcl',
        extra_config_content     => template('vim_tuning/vim-syntax-vcl_plugin.erb'),
      },
      {
        extra_config_title       => 'Other Config',
        extra_config_description => 'enables syntax highlighting by default',
        extra_config_content     => 'syntax on',
      },
    ],
}

vim_tuning::install { 'username2':
    user                 => 'username2',
    homedir              => '/home/username2',
    plugins              => ['pld-linux/vim-syntax-vcl'],
    vimrc_custom_content => 'set backgound=light',
    extra_configs        => [
      {
        extra_config_title       => 'Vim VCL Highlighting',
        extra_config_description => 'https://github.com/pld-linux/vim-syntax-vcl',
        extra_config_content     => template('vim_tuning/vim-syntax-vcl_plugin.erb'),
      },
    ],
}
```

## Reference

- [**Public classes**](#public-classes)
    - [Class: vim_tuning](#class-vim_tuning)
- [**Private classes**](#private-classes)
- [**Public defined types**](#public-defined-types)
    - [Defined type: vim_tuning::install](#defined-type-vim_tuninginstall)
- [**Private defined types**](#private-defined-types)
    - [Defined type: vim_tuning::vim_rc::extra_config](#defined-type-vim_tuningvim_rcextra_config)
- [**Templates**](#templates)

### Public Classes

#### Class: `vim_tuning`

### Private Classes

### Public defined types

#### Defined type: `vim_tuning::install`

It is responsible for setting the vim environment for each system user. This is the main defined type you must use.

##### `user`

Indicates the name of the user that affect this configuration. **It's mandatory**. Default: undef.

##### `homedir`

The absolute home directory of the user concerned. **It's mandatory**. Default: undef.

##### `plugins_ensure`

The basic state that the plugins should be in. Valid options: 'present', 'absent' and 'latest'. Default: 'present'.

##### `plugins`

It must contain you want to download, install and maintain. If it's set to `undef` then default plugins will be installed. Note the name of plugins is built by `'githubuser/reponame'`. Valid options: A string, an array of strings, or undef. Default: undef.

##### `vimrc_custom_content`

With this parameter we can introduce arbitrary code. You can use the functions of "source" or "template" or even concatinate lines with "\ n". Valid options: Strings. Default: undef.

##### `extra_configs`

Con este parametro podremos construir muchas configuraciones estructuradas. Go to [`vim_tuning::vim_rc::extra_config`](#defined-type-vim_tuningvim_rcextra_config) for hash details. Valid options: Hash, an array of hashes, or undef. Default: undef.

### Private defined types

#### Defined type: `vim_tuning::vim_rc::extra_config`


### Templates

## Limitations

This is where you list OS compatibility, version compatibility, etc. If there
are Known Issues, you might want to include them under their own heading here.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You can also add any additional sections you feel
are necessary or important to include here. Please use the `## ` header.
