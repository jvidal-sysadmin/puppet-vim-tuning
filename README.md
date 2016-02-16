# vim_tuning

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with vim_tuning](#setup)
    * [What vim_tuning affects](#what-vim_tuning-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with vim_tuning](#beginning-with-vim_tuning)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This [Puppet module](https://docs.puppetlabs.com/puppet/latest/reference/modules_fundamentals.html) simplifies the [vim](http://www.vim.org/) personalisation (.vimrc file) by a clean and orderly way. In addition to install and maintain [pathogen](https://github.com/tpope/vim-pathogen) also is responsible for installing and updating GitHub third-party plugins such as [vim-puppet](https://github.com/rodjek/vim-puppet), [syntastic](https://github.com/scrooloose/syntastic) or [vim-airline](https://github.com/vim-airline/vim-airline).

Basically, we can customize each system user with different combinations of configurations and plugins. We can also reuse those configurations and create new ones in a cleaner way.

## Setup

### What vim_tuning affects **OPTIONAL**

If it's obvious what your module touches, you can skip this section. For
example, folks can probably figure out that your mysql_instance module affects
their MySQL instances.

If there's more that they should know about, though, this is the place to mention:

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute.
* Dependencies that your module automatically installs.
* Warnings or other important notices.

### Setup Requirements **OPTIONAL**

If your module requires anything extra before setting up (pluginsync enabled,
etc.), mention it here.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you might want to include an additional "Upgrading" section
here.

### Beginning with vim_tuning

The very basic steps needed for a user to get the module up and running. This
can include setup steps, if necessary, or it can be an example of the most
basic use of the module.

## Usage

This section is where you describe how to customize, configure, and do the
fancy stuff with your module here. It's especially helpful if you include usage
examples and code samples for doing things with your module.

## Reference

Here, include a complete list of your module's classes, types, providers,
facts, along with the parameters for each. Users refer to this section (thus
the name "Reference") to find specific details; most users don't read it per
se.

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
