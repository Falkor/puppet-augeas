# File::      <tt>augeas-params.pp</tt>
# Author::    Sebastien Varrette (Sebastien.Varrette@uni.lu)
# Copyright:: Copyright (c) 2011 Sebastien Varrette
# License::   GPLv3
#
# Time-stamp: <Fri 2011-12-16 15:07 svarrette>
# ------------------------------------------------------------------------------
# = Class: augeas::params
#
# In this class are defined as variables values that are used in the
# augeas classes.
# This class should be included, where necessary, and eventually be enhanced
# with support for more OS
#
# == Warnings
#
# /!\ Always respect the style guide available
# here[http://docs.puppetlabs.com/guides/style_guide]
#
# [Remember: No empty lines between comments and class definition]
#
class augeas::params {
    ######## DEFAULTS FOR VARIABLES USERS CAN SET ##########################
    # (Here are set the defaults, provide your custom variables externally)
    # (The default used is in the line with '')
    ###########################################

    # Permits to force the version of augeas, else puppet will only ensure the
    # packages are present.
     $version = $augeas_version ? {
        ''      => 'present',
        default => "${augeas_version}",
    }

    #### MODULE INTERNAL VARIABLES  #########
    # (Modify to adapt to unsupported OSes)
    #######################################
    $augeas_packages = $operatingsystem ? {
        /(?i-mx:ubuntu|debian)/ => [ 'augeas-lenses', 'libaugeas0', 'augeas-tools'],
        default => [ 'augeas', 'augeas-libs' ],
    }

    $libaugeas_ruby_packages = $operatingsystem ? {
        /(?i-mx:ubuntu|debian)/  => [ 'libaugeas-ruby1.8', 'libaugeas-dev' ],
        default => [ 'ruby-augeas' ],
    }

}

