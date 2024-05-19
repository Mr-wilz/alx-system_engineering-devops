# Setup New Ubuntu server with nginx and,
# add a custom HTTP header

exec { 'update-system':
  command => '/usr/bin/apt-get update',
  path    => ['/usr/bin', '/usr/sbin', '/bin', '/sbin'],
  before  => Package['nginx'],
}

package { 'nginx':
  ensure  => 'installed',
  require => Exec['update-system'],
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
  require => Package['nginx'],
}

exec { 'redirect_me':
  command => '/bin/sed -i "24i\\    rewrite ^/redirect_me https://th3-gr00t.tk/ permanent;" /etc/nginx/sites-available/default',
  path    => ['/usr/bin', '/usr/sbin', '/bin', '/sbin'],
  require => Package['nginx'],
  notify  => Service['nginx'],
}

exec { 'http_header':
  command => '/bin/sed -i "25i\\    add_header X-Served-By \$hostname;" /etc/nginx/sites-available/default',
  path    => ['/usr/bin', '/usr/sbin', '/bin', '/sbin'],
  require => Exec['redirect_me'],
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx'],
  subscribe => [File['/var/www/html/index.html'], Exec['redirect_me'], Exec['http_header']],
}
