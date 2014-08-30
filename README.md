-*- mode: markdown; mode: auto-fill; fill-column: 80 -*-

     Time-stamp: <Sat 2014-08-30 15:17 svarrette>

-------------------------------------------

# svarrette-augeas Puppet Module

Puppet module to manage Augeas, a nice a configuration editing tool -- see <http://augeas.net/>

* Author: S. Varrette
* Copyright: `Copyright (c) 2011 S. Varrette`  
* [GPL-3.0 Licence](LICENSE)
* [Puppet Forge](https://forge.puppetlabs.com/)
* [Online Project Page](https://github.com/Falkor/puppet-augeas)  -- [Sources](https://github.com/Falkor/puppet-augeas) -- [Issues](https://github.com/Falkor/puppet-augeas/issues)

## Synopsis

This Puppet module is an helper to manage [Augeas](http://augeas.net/), a
configuration API. 

The various operations of this repository are piloted from a `Rakefile` which
assumes that you have [RVM](https://rvm.io/) installed on your system.

### Supported Platforms

* Debian

### Usage

      include augeas      

## Puppet Module Layout

       svarrette-augeas/       # Main directory for the 'svarrette-augeas' module
           `-- metadata.json     # Module configuration - cf [here](https://docs.puppetlabs.com/puppet/latest/reference/modules_publishing.html#write-a-metadatajson-file)
           `-- README.md         # This file
           `-- lib/              # custom facts/type/provider definitions
           `-- manifests/
                `-- init.pp      # Main manifests file
                `-- classes/     # Hold manifest for svarrette-augeas classes/
                     `-- augeas.pp         # defines the svarrette-augeas class
                     `-- augeas-params.pp  # svarrette-augeas module variables 
           `-- tests/            # Contains examples showing how to declare the module’s classes and defined type
           `-- spec/             # Contains spec tests for any plugins in the lib directory
           `-- Rakefile          # Definition of the [rake](https://github.com/jimweirich/rake) tasks
           `-- .ruby-{version,gemset}   # [RVM](https://rvm.io/) configuration
           `-- Gemfile[.lock]    # [Bundler](http://bundler.io/) configuration
           `-- .git/             # Hold git configuration

## Documentation

Please refer to the header of each manifest files to understand the usage of
classes and definitions associated to the 'svarrette-augeas' module.
 
Alternatively, generate automatically the documentation via
[`puppet doc`](http://docs.puppetlabs.com/man/doc.html) as follows:  

       $> rake doc   # Not yet implemented
       
For other information, please refer to:

* the `metadata.json` file in this directory 

## Librarian-Puppet / R10K

You can of configure svarrette-augeas in your `Puppetfile` to make it
available with [Librarian puppet](http://librarian-puppet.com/) or [r10k](https://github.com/adrienthebo/r10k)

## Issues / Feature request

You can submit bug / issues / feature request using the 
[svarrette-augeas Tracker](https://github.com/Falkor/puppet-augeas/issues). 

-------------------------

## Implementation details

If you want to contribute to the code, you shall be aware of the way this module
is organized implementation details.   

### Git Branching Model

The Git branching model for this repository follows the guidelines of
[gitflow](http://nvie.com/posts/a-successful-git-branching-model/).  
In particular, the central repository holds two main branches with an infinite
lifetime:  

* `production`: the branch holding
  tags of the successive releases of this tutorial 
* `devel`: the main branch
  where the sources are in a state with the latest delivered development changes 
  for the next release. This is the *default* branch you get when you clone the
  repository, and the one on which developments will take places.  

You should therefore install [git-flow](https://github.com/nvie/gitflow), and
probably also its associated
[bash completion](https://github.com/bobthecow/git-flow-completion).  

### Ruby, [RVM](https://rvm.io/) and [Bundler](http://bundler.io/)

The various operations that can be conducted from this repository are piloted
from a `Rakefile` and assumes you have a running Ruby installation.

The bootstrapping of your repository is based on [RVM](https://rvm.io/), **thus
ensure this tools are installed on your system** -- see
[installation notes](https://rvm.io/rvm/install).

The ruby stuff part of this repository corresponds to the following files:

* `.ruby-{version,gemset}`: [RVM](https://rvm.io/) configuration, use the name of the
  project as [gemset](https://rvm.io/gemsets) name
* `Gemfile[.lock]`: used by `[bundle](http://bundler.io/)`

You should now be able to access the list of available tasks by running:

	$> rake -T

You probably wants to activate the bash-completion for rake tasks.
I personnaly use the one provided [here](https://github.com/ai/rake-completion)

Also, some of the tasks are hidden. 
Run `rake -T -A` to list all of them. 

### Repository Setup

Then, to make your local copy of the repository ready to use the
[git-flow](https://github.com/nvie/gitflow) workflow and the local
[RVM](https://rvm.io/)  setup, you have to run the following commands once you
cloned it for the first time: 

      $> rake setup 

### RSpec tests

I try to define a set of unitary tests to validate the different function of my
library using [Rspec](http://rspec.info/) 

You can run these tests by issuing:

	$> rake rspec
	
By conventions, you will find all the currently implemented tests in the `spec/`
directory, in files having the `_spec.rb` suffix. This is expected from the
`rspec` task of the `Rakefile`.    

**Important** Kindly stick to this convention, and feature tests for all
  definitions/classes/modules you might want to add to `FalkorLib`. 

### Releasing mechanism

The operation consisting of releasing a new version of this repository is
automated by a set of tasks within the `Rakefile`. 

In this context, a version number have the following format:

      <major>.<minor>.<patch>

where:

* `< major >` corresponds to the major version number
* `< minor >` corresponds to the minor version number
* `< patch >` corresponds to the patching version number

Example: `1.2.0`

The current version number is stored in the file `metadata.json`. 
For more information on the version, run:

     $> rake version:info

If a new  version number such be bumped, you simply have to run:

      $> rake version:bump:{major,minor,patch}

This will start the release process for you using `git-flow`.
Then, to make the release effective, just run:

      $> rake version:release

This will finalize the release using `git-flow`, create the appropriate tag and
merge all things the way they should be. 

# Contributing

This project is released under the terms of the [gpl-3.0 Licence](LICENSE). 
So you are more than welcome to contribute to its development as follows: 

1. Fork it
2. Create your feature branch (`git:feature:start[<feature_name>]`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git flow feature publish <feature_name>`)
5. Create new Pull Request

## Resources

### Git 

You should become familiar (if not yet) with Git. Consider these resources: 

* [Git book](http://book.git-scm.com/index.html)
* [Github:help](http://help.github.com/mac-set-up-git/)
* [Git reference](http://gitref.org/)

### Puppet/Augeas

The design of this module is inspired by the following contributions:

* camptocamp[https://github.com/camptocamp/puppet-augeas/]
