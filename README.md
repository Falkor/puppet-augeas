-*- mode: markdown; mode: auto-fill; fill-column: 80 -*-

# Augeas Puppet Module 

[![Puppet Forge](http://img.shields.io/puppetforge/v/svarrette/augeas.svg)](https://forge.puppetlabs.com/svarrette/augeas)
[![License](http://img.shields.io/:license-gpl3.0-blue.svg)](LICENCE)
![Supported Platforms](http://img.shields.io/badge/platform-debian-lightgrey.svg)

Puppet module to manage Augeas, a nice a configuration editing tool
      Copyright (c) 2014 S. Varrette <sebastien.varrette@uni.lu>
      

* [Online Project Page](https://github.com/Falkor/puppet-augeas)  -- [Sources](https://github.com/Falkor/puppet-augeas) -- [Issues](https://github.com/Falkor/puppet-augeas/issues)

## Synopsis

This Puppet module is an helper to manage [Augeas](http://augeas.net/), a configuration API.
The various operations of this repository are piloted from a `Rakefile` which
assumes that you have [RVM](https://rvm.io/) installed on your system.

## Dependencies

See `metadata.json`.

## svarrette-augeas class parameters

* `$ensure` [Default: 'present']: Ensure svarrette-augeas is present, absent etc. 

## Usage

### class svarrette-augeas

     class { 'svarrette-augeas': 
         
     }


## Documentation

Please refer to the header of each manifest files to understand the usage of
classes and definitions associated to the 'svarrette-augeas' module.
 
Alternatively, generate automatically the documentation via
[`puppet doc`](http://docs.puppetlabs.com/man/doc.html) as follows:  

       $> rake doc   # Not yet implemented
       
For other information, please refer to the `metadata.json` file in this directory 

## Librarian-Puppet / R10K Setup

You can of course configure svarrette-augeas in your `Puppetfile` to make it 
available with [Librarian puppet](http://librarian-puppet.com/) or
[r10k](https://github.com/adrienthebo/r10k) by adding the following entry:

     mod svarrette-augeas, 
         :git => https://github.com/Falkor/puppet-augeas,
         :ref => production 


## Issues / Feature request

You can submit bug / issues / feature request using the 
[svarrette-augeas Tracker](https://github.com/Falkor/puppet-augeas/issues). 


## Developments / Contributing to the code 

If you want to contribute to the code, you shall be aware of the way this module
is organized.
These elements are detailed on [`doc/contributing.md`](doc/contributing.md)

You are more than welcome to contribute to its development by 
[sending a pull request](https://help.github.com/articles/using-pull-requests). 

## Resources

### Git 

You should become familiar (if not yet) with Git. Consider these resources: 

* [Git book](http://book.git-scm.com/index.html)
* [Github:help](http://help.github.com/mac-set-up-git/)
* [Git reference](http://gitref.org/)

