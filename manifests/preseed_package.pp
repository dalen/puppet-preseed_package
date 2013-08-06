# == Define: preseed_package
#
# Install package with preseed file.
#
# === Parameters
#
# [*ensure*]
#   The ensure parameter for the package
#
# [*source*]/[*content*]
#   The source or content for the preseed file
#
define preseed_package::preseed_package ( $ensure, $source=undef, $content=undef ) {
  include preseed_package::setup

  file { "${::puppet_vardir}/preseed/${name}.preseed":
    source  => $source,
    content => $content,
    owner   => root,
    group   => root,
    mode    => '0600',
  }

  package { $name:
    ensure       => $ensure,
    responsefile => "${::puppet_vardir}/preseed/${name}.preseed",
    require      => File["${::puppet_vardir}/preseed/${name}.preseed"],
  }
}
