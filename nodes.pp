#
# nodes.pp - defines all puppet nodes
#

# self-manage the puppet master server
node 'puppet' { }

##### CLIENTS

node 'client1' {
  class { 'helloworld': }
}

node 'client2' {
}

node 'introducer' {
  include tahoe

  tahoe::introducer { 'introducer':
    ensure    => present,
    directory => '/srv/tahoe-introducer',
    webport   => 'tcp:8123:interface=0.0.0.0',
  }
}

node 'storage0' {
  include tahoe
  class { 'helloworld': }
}

node 'client' {
  include tahoe
  class { 'helloworld': }
}

node 'helper' {
  include tahoe
  class { 'helloworld': }
}
