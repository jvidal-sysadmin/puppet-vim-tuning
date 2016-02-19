# vim_tuning

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with vim_tuning](#setup)
    - [Beginning with vim_tuning](#beginning-with-vim_tuning)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
    - [Public classes](#public-classes)
    - [Private classes](#private-classes)
    - [Public defined types](#public-defined-types)
    - [Private defined types](#private-defined-types)
    - [Templates](#templates)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This [Puppet module](https://docs.puppetlabs.com/puppet/latest/reference/modules_fundamentals.html) simplifies the [vim](http://www.vim.org/) personalisation (.vimrc file) by a clean and orderly way. In addition to install and maintain [pathogen](https://github.com/tpope/vim-pathogen) also is responsible for installing and updating GitHub third-party plugins such as [vim-puppet](https://github.com/rodjek/vim-puppet), [syntastic](https://github.com/scrooloose/syntastic) or [vim-airline](https://github.com/vim-airline/vim-airline).

Basically, we can customize each system user with different combinations of configurations and plugins. We can also reuse those configurations and create new ones in a cleaner way.

## Setup

**What the apache Puppet module affects:**

- Configuration files and directories (created and written to).
- Package/configuration files for Vim.
- GitHub repositories.

### Beginning with vim_tuning

To have Puppet configure vim with the default parameters for **root** user, just declare the `vim-tuning` class:

``` puppet
class { 'vim-tuning': }
```

The Puppet module applies a default configuration. These defaults works well in Puppet develoment environments but you can customize the class's parameters to suit your preferences. 

You can customize parameters when declaring the `vim-tuning` class. For instance, this declaration installs `vim` without vim plugins, allowing you to customize all configurations and plugins:

``` puppet
class { 'vim-tuning':
  default_root_install => false,
}
```
## Usage

The default `vim-tuning`][] class manage vim package and sets up root user with optimize settings and the best known plugins.

To configure another system user you must use `vim-tuning::install`defined type.

> **Note**: See the [`vim-tuning::install`](#defined-type-vim-tuninginstall) defined type's reference for a list of all virtual host parameters.

## Reference

## Reference

- [**Public classes**](#public-classes)
    - [Class: vim-tuning](#class-vim-tuning)
- [**Private classes**](#private-classes)
- [**Public defined types**](#public-defined-types)
    - [Defined type: vim-tuning::install](#defined-type-vim-tuninginstall)
- [**Private defined types**](#private-defined-types)
- [**Templates**](#templates)

### Public Classes

#### Class: vim-tuning

### Private Classes

### Public defined types

#### Defined type: vim-tuning::install

### Private defined types

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
