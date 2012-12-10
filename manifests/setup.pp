class preseed_package::setup {
  file { "${::puppet_vardir}/preseed":
    ensure => directory,
    purge  => true,
    owner  => root,
    group  => root,
    mode   => '0700',
  }
}
