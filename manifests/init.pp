class apache {
  # Ensure the Apache package is installed
  package { 'apache2':
    ensure => installed,
  }

  # Ensure the Apache service is enabled and running
  service { 'apache2':
    ensure     => running,
    enable     => true,
    require    => Package['apache2'],
  }

  # Manage the main configuration file
  file { '/etc/apache2/apache2.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/apache/apache2.conf',
    require => Package['apache2'],
  }
}
