# File::      <tt>augeas.pp</tt>
# Author::    Sebastien Varrette (Sebastien.Varrette@uni.lu)
# Copyright:: Copyright (c) 2011 Sebastien Varrette
# License::   GPLv3
# ------------------------------------------------------------------------------
# = Class: augeas
#
# Configure and manage augeas
#
# == Parameters:
#
# $augeas_version:: *Default*: 'present'. Permits to force the version of augeas, else puppet will only ensure the  packages are present.
#
# == Actions:
#
# Install and configure augeas
#
# == Requires:
#
# n/a
#
# == Sample Usage:
#
#     include augeas
#
# == Warnings
#
# /!\ Always respect the style guide available
# here[http://docs.puppetlabs.com/guides/style_guide]
#
#
# [Remember: No empty lines between comments and class definition]
#
class augeas( $version = $augeas::params::version ) inherits augeas::params {
    info ("Configuring augeas (with version = ${version})")

    case $::operatingsystem {
        debian, ubuntu:         { include augeas::debian }
        redhat, fedora, centos: { include augeas::redhat }
        default: {
            fail("Module $module_name is not supported on $operatingsystem")
        }
    }
}

# ------------------------------------------------------------------------------
# = Class: augeas::common
#
# Base class to be inherited by the augeas class
#
# Note: respect the Naming standard provided here[http://projects.puppetlabs.com/projects/puppet/wiki/Module_Standards]
class augeas::common {
    # Load the variables used in this module. Check the ssh-server-params.pp file
    require augeas::params

    # Install basic packages de Augeas
    package { $augeas::params::augeas_packages :
        ensure  => "${augeas::version}",
    }

    package { $augeas::params::libaugeas_ruby_packages :
        ensure  => present,
    }
}


# ------------------------------------------------------------------------------
# = Class: augeas::debian
#
# Specialization class for Debian systems
class augeas::debian inherits augeas::common { }

# ------------------------------------------------------------------------------
# = Class: augeas::redhat
#
# Specialization class for Redhat systems
class augeas::redhat inherits augeas::common { }



